defmodule OcapRpc.Internal.Utils do
  @moduledoc """
  Utility functions
  """

  def sha3(data) do
    data |> :keccakf1600.sha3_256() |> Base.encode16() |> String.downcase()
  end

  def call_data(method, value) do
    value = value |> String.replace_leading("0x", "") |> padding()
    method_sig = get_method_sig(method)
    "#{method_sig}#{value}"
  end

  def get_method_sig(method), do: method |> sha3() |> String.slice(0, 8)

  def sig_balance_of(from) do
    call_data("balanceOf(address)", from)
  end

  def sig_total_supply do
    call_data("totalSupply()", "")
  end

  def padding(str), do: String.pad_leading(str, 64, ["0"])

  def addr_to_topic(addr) do
    case addr do
      nil -> nil
      "0x" <> addr -> "0x#{padding(addr)}"
      _ -> "0x#{padding(addr)}"
    end
  end

  def int_to_hex(int), do: "0x" <> (int |> Integer.to_string(16) |> padding())
  def hex_to_int("0x" <> hex), do: String.to_integer(hex, 16)

  def hex_to_binary("0x" <> hex), do: hex_to_binary(hex)
  def hex_to_binary(hex), do: Base.decode16!(hex, case: :mixed)

  def get_chain_id() do
    :ocap_rpc
    |> Application.get_env(:eth, [])
    |> Keyword.get(:chain_id, 1)
  end

  def get_timeout(chain) when chain in [:btc, :eth, :cmt, :ipfs] do
    :ocap_rpc
    |> Application.get_env(chain, [])
    |> Keyword.get(:timeout, 5000)
  end

  def get_connection(chain) when chain in [:btc, :eth, :cmt, :ipfs] do
    :ocap_rpc
    |> Application.get_env(chain)
    |> Keyword.get(:conn)
  end
end

defmodule OcapRpc.Internal.EthTransaction do
  @moduledoc """
  Contains methods to construct and sign Ethereum transactions.
  """
  alias OcapRpc.Eth.Account
  alias OcapRpc.Eth.Chain
  alias OcapRpc.Eth.Transaction
  alias OcapRpc.Internal.EthTransaction.Helper

  @doc """
  Composes a transaction to sign.
  """
  def get_transaction_to_sign(from, to, value, opts \\ []) do
    nonce = get_nonce_by_address(from, opts)
    gas_price = get_gas_price(opts)
    gas_limit = get_gas_limit(opts)
    input = Keyword.get(opts, :input, nil)
    Helper.get_transaction_to_sign(nonce, gas_price, gas_limit, to, value, input)
  end

  @doc """
  Compose and sign a transaction, returns the raw transaction.
  """
  def compose_transaction(private_key, to, value, opts \\ []) do
    nonce = get_nonce_by_sk(private_key, opts)
    gas_price = get_gas_price(opts)
    gas_limit = get_gas_limit(opts)
    input = Keyword.get(opts, :input, nil)

    get_raw_transaction(nonce, gas_price, gas_limit, to, value, input, private_key)
  end

  @doc """
  Signs and then broadcasts the transaction, returns the transaction hash.
  """
  def send_transaction(private_key, to, value, opts \\ []) do
    private_key
    |> compose_transaction(to, value, opts)
    |> Transaction.send_raw()
  end

  defp get_raw_transaction(nonce, gas_price, gas_limit, to, value, input, private_key) do
    {_signature, r, s, v} =
      nonce
      |> Helper.get_transaction_digest_to_sign(gas_price, gas_limit, to, value, input)
      |> Helper.get_signature(private_key)

    "0x" <> Helper.get_raw_transaction(nonce, gas_price, gas_limit, to, value, input, v, r, s)
  end

  defp get_nonce_by_sk(private_key, opts) do
    private_key
    |> Helper.get_address_from_private_key()
    |> get_nonce_by_address(opts)
  end

  defp get_nonce_by_address(address, opts) do
    case Keyword.get(opts, :nonce, nil) do
      nil -> Transaction.get_transaction_count(address, :latest)
      nonce -> nonce
    end
  end

  defp get_gas_price(opts) do
    case Keyword.get(opts, :gas_price, nil) do
      nil -> Chain.gas_price()
      0 -> Chain.gas_price()
      gas_price -> gas_price
    end
  end

  defp get_gas_limit(opts) do
    gas_limit = Keyword.get(opts, :gas_limit, nil)
    input = Keyword.get(opts, :input, nil)
    get_gas_limit(gas_limit, input)
  end

  defp get_gas_limit(nil, input) when input in [nil, ""], do: 22_000
  defp get_gas_limit(nil, _), do: 30_000
  defp get_gas_limit(gas_limit, _), do: gas_limit
end

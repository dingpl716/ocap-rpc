## 0.15.3 (Jun 10, 2022)
  - Allow users not to put configs for all chains in their config.exs

## 0.15.2 (December 30, 2019)
  - Make sure the RPC return nil if the tx is not persisted on chain.

## 0.15.1 (December 20, 2019)
  - Fix nonce issue.

## 0.15.0 (December 20, 2019)
  - Add APIs to return unsigned transaction and ERC20 transfer.

## 0.14.5 (October 10, 2019)
  - Add compose transaction and transfer

## 0.14.4 (August 21, 2019)
  - Update deps version

## 0.14.3 (August 20, 2019)
  - Supports sending ethereum transaction.

## 0.14.2 (August 15, 2019)
  - fix tests
  - Fix the problem caused by ethereum/abi not being able to decode input data with extra bytes.

## 0.14.1 (November 29, 2018)
  - delete distillery and make abi optional

## 0.14.0 (November 28, 2018)
  - Bring  ocap rpc to use elixir 1.7.4
  - support cmt basic rpc (#39)

## 0.13.4 (November 13, 2018)
  - Handle the case where the block returned is null.
  - Support cmt basic rpc.

## 0.13.3 (November 06, 2018)
  - Disable the unnecessary logs.

## 0.13.2 (November 02, 2018)
  - Updates for arc block listener ethereum v2.

## 0.13.1 (November 01, 2018)
  - update args in ipfs rpc

## 0.13.0 (October 31, 2018)
  - support most of the ipfs APIs (note that the file upload is not fully functional yet)
  - support the first ipfs rpc

## 0.12.8 (October 30, 2018)
  - Add logic to handle the case where no traces retrieved for calculating block reward.

## 0.12.7 (October 28, 2018)
  - Use the new abi to handle the memory leak.

## 0.12.6 (October 27, 2018)
  - Resolve the ignored transactions at runtime.

## 0.12.5 (October 27, 2018)
  - Ignore transactions that could cause memory leak while decoding ABI.

## 0.12.4 (October 27, 2018)
  - Stop decoding huge transaction input to prevent potential memory leak.

## 0.12.3 (October 25, 2018)
  - Update the logic to handle unprintable string.

## 0.12.2 (October 25, 2018)
  - Update the logic to parse error and receipt status in trace.

## 0.12.1 (October 24, 2018)
  - Add time and receipt status to trace.

## 0.12.0 (August 28, 2018)
  - fix transaction tx type issue and parse contract from / to better
  - retrieve block reward and change unit to wei

## 0.11.8 (September 13, 2018)
  - Bypass the contract_to parsing issue for now.

## 0.11.7 (September 12, 2018)
  - Handle the case where block number is out of range.

## 0.11.6 (August 31, 2018)
 - Disable transaction trace for now.

## 0.11.5 (August 31, 2018)
  - Add code to handle error.

## 0.11.4 (August 29, 2018)
 - move timeout value to config

## 0.11.3 (August 25, 2018)
  - add tx time

## 0.11.1 (August 24, 2018)
  - Change namespace of PoisonedDecimal.

## 0.11.0 (August 24, 2018)
  - support basic btc rpc

## 0.10.3 (August 23, 2018)
  - Remove 0x prefix for pre_hash

## 0.10.2 (August 23, 2018)
  - fix various issues and use wei in all values

## 0.10.1 (August 21, 2018)
  - Fix the readme.md

## 0.10.0 (August 16, 2018)
  - replace httpoison with tesla
  - add retry support

## 0.9.7 (August 10, 2018)
  - fix sentry issue


## 0.9.0 (August 01, 2018)
  - allow fees and reward calculation.

## 0.8.0 (August 01, 2018)
  - refactor the data type
  - refactor the yaml files

## 0.7.2 (July 30, 2018)


## 0.7.0 (July 29, 2018)
  - support decode to erc20

## 0.6.0 (July 29, 2018)
  - add basic test suites

## 0.5.0 (July 28, 2018)
  - update the code to support more functionalities

## 0.4.0 (July 27, 2018)
  - rename blockchain rpc to ocap rpc

## 0.3.0 (July 27, 2018)
  - support contract transactions

## 0.2.1 (July 27, 2018)


## 0.2.0 (July 26, 2018)

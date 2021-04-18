#!/bin/bash

# Deployment
erdpy --verbose contract deploy --project=contracts --pem="wallet.pem" --gas-limit=5000000 --proxy="https://testnet-api.elrond.com" --outfile="counter.json" --recall-nonce --send
export CONTRACT_ADDRESS=$(python3 -c "import json; data = json.load(open('counter.json')); print(data['emitted_tx']['address'])")

# Interaction
erdpy --verbose contract call $CONTRACT_ADDRESS --pem="wallet.pem" --gas-limit=2000000 --function="increment" --proxy="https://testnet-api.elrond.com" --recall-nonce --send
sleep 10
erdpy --verbose contract call $CONTRACT_ADDRESS --pem="wallet.pem" --gas-limit=2000000 --function="increment" --proxy="https://testnet-api.elrond.com" --recall-nonce --send
sleep 10
erdpy --verbose contract call $CONTRACT_ADDRESS --pem="wallet.pem" --gas-limit=2000000 --function="decrement" --proxy="https://testnet-api.elrond.com" --recall-nonce --send
sleep 10

# Querying
erdpy contract query $CONTRACT_ADDRESS --function="get" --proxy="https://testnet-api.elrond.com"
# import time
# import os
# import requests
# from dotenv import load_dotenv
# from web3 import Web3
# from eth_account import Account

# # Load environment variables from .env file
# load_dotenv()

# # Set up web3 connections for both chains
# target_w3 = Web3(Web3.HTTPProvider(os.getenv('TARGET_RPC_URL')))


# # Target Oracle ABI (for transmitting price)
# TARGET_ORACLE_ABI = [
#     {
#         "inputs": [],
#         "name": "updateData",
#         "outputs": [],
#         "stateMutability": "nonpayable",
#         "type": "function"
#     },
#     {
#         "inputs": [],
#         "name": "decimals",
#         "outputs": [{"internalType": "uint8", "name": "", "type": "uint8"}],
#         "stateMutability": "view",
#         "type": "function"
#     },
#     {
#         "inputs": [],
#         "name": "latestRoundData",
#         "outputs": [
#             {"internalType": "uint80", "name": "roundId", "type": "uint80"},
#             {"internalType": "int192", "name": "answer", "type": "int192"},
#             {"internalType": "uint256", "name": "startedAt", "type": "uint256"},
#             {"internalType": "uint256", "name": "updatedAt", "type": "uint256"},
#             {"internalType": "uint80", "name": "answeredInRound", "type": "uint80"}
#         ],
#         "stateMutability": "view",
#         "type": "function"
#     }
# ]


# def get_target_history():
#     # Set up the contract
#     contract_address = os.getenv('TARGET_ORACLE_ADDRESS')
#     contract = target_w3.eth.contract(address=contract_address, abi=TARGET_ORACLE_ABI)
    
#     # Get the account from the private key
#     account = Account.from_key(os.getenv('PRIVATE_KEY'))
    
#     # Build the transaction
#     round_data = contract.functions.latestRoundData().call()

#     # Extract the updatedAt timestamp (assuming it's the 4th output)
#     updatedAt = round_data[3]

#     # Get the current timestamp
#     current_timestamp = int(time.time())
    
#     # Get the update interval from environment variable
#     update_interval = int(os.getenv('UPDATE_INTERVAL', 3600))

#     print(updatedAt, current_timestamp, current_timestamp - updatedAt)

#     # Check if we need to sleep
#     if (current_timestamp - updatedAt) < update_interval:
#         remaining_time = update_interval - (current_timestamp - updatedAt)
#         print(f"Sleeping for {remaining_time} seconds...")
#         time.sleep(remaining_time)
    
#     # Continue with the rest of your logic here
#     # For example, you can now fetch the target history or perform other actions
#     print("Running the target history logic...")

#     # Convert the float value to int192
#     # Adjust decimals as needed for your target oracle
#     print(round_data)

# from web3 import Web3
# from eth_account import Account
# import os

# def transmit_value():
#     # Initialize Web3
#     target_w3 = Web3(Web3.HTTPProvider(os.getenv('TARGET_RPC_URL')))
    
#     # Set up the contract
#     contract_address = os.getenv('TARGET_ORACLE_ADDRESS')
#     contract = target_w3.eth.contract(address=contract_address, abi=TARGET_ORACLE_ABI)
    
#     # Get the account from private key
#     private_key = os.getenv('PRIVATE_KEY')
#     account = Account.from_key(private_key)

#     # Build the transaction
#     decimals = contract.functions.decimals().call()

#     # Convert the float value to int192
#     # Adjust decimals as needed for your target oracle
#     # int192_value = int(value * 10**decimals)  
    
#     # Build the transaction
#     nonce = target_w3.eth.get_transaction_count(account.address)
    
#     transaction = contract.functions.updateData().build_transaction({
#         'chainId': target_w3.eth.chain_id,
#         'gasPrice': target_w3.eth.gas_price,
#         'nonce': nonce,
#         'from': account.address,
#     })
    
#     # Sign the transaction
#     signed_txn = target_w3.eth.account.sign_transaction(transaction, private_key)
    
#     # Send the transaction
#     try:
#         # Use the hex() method to convert the raw transaction to hex
#         tx_hash = target_w3.eth.send_raw_transaction(signed_txn.raw_transaction)
#         print(f"Transaction sent! Hash: {tx_hash.hex()}")
#         # Wait for the transaction receipt
#         tx_receipt = target_w3.eth.wait_for_transaction_receipt(tx_hash)
#         print(f"Transaction successful. Hash: {tx_hash.hex()}")
#         return tx_receipt
#     except Exception as e:
#         print(f"An error occurred: {e}")
#         raise


# def main():
    
#     interval = int(os.getenv('UPDATE_INTERVAL', 3600))  # Default to 1 hour if not set
#     get_target_history()
#     while True:
#         try:
#             print("Transmitting value to target oracle")
#             receipt = transmit_value()
#             print(f"Transaction mined in block {receipt['blockNumber']}")
            
#         except Exception as e:
#             print(f"An error occurred: {e}")
        
#         print(f"Sleeping for {interval} seconds...")
#         time.sleep(interval)

# if __name__ == "__main__":
#     print('price updater is live')
#     main()


import time
import os
import requests
from dotenv import load_dotenv
from web3 import Web3
from eth_account import Account

# Load environment variables from .env file
load_dotenv()

# Oracle configuration list
ORACLE_CONFIGS = [
    {
        'RPC_URL': os.getenv('TARGET_RPC_URL'),
        'ORACLE_ADDRESS': os.getenv('TARGET_ORACLE_ADDRESS_1'),
        'PRIVATE_KEY': os.getenv('PRIVATE_KEY')
    },
    {
        'RPC_URL': os.getenv('TARGET_RPC_URL'),
        'ORACLE_ADDRESS': os.getenv('TARGET_ORACLE_ADDRESS_2'),
        'PRIVATE_KEY': os.getenv('PRIVATE_KEY')
    },
     {
        'RPC_URL': os.getenv('TARGET_RPC_URL'),
        'ORACLE_ADDRESS': os.getenv('TARGET_ORACLE_ADDRESS_3'),
        'PRIVATE_KEY': os.getenv('PRIVATE_KEY')
    },
]

# Target Oracle ABI (for transmitting price)
TARGET_ORACLE_ABI = [
    {
        "inputs": [],
        "name": "updateData",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [],
        "name": "decimals",
        "outputs": [{"internalType": "uint8", "name": "", "type": "uint8"}],
        "stateMutability": "view",
        "type": "function"
    },
    {
        "inputs": [],
        "name": "latestRoundData",
        "outputs": [
            {"internalType": "uint80", "name": "roundId", "type": "uint80"},
            {"internalType": "int192", "name": "answer", "type": "int192"},
            {"internalType": "uint256", "name": "startedAt", "type": "uint256"},
            {"internalType": "uint256", "name": "updatedAt", "type": "uint256"},
            {"internalType": "uint80", "name": "answeredInRound", "type": "uint80"}
        ],
        "stateMutability": "view",
        "type": "function"
    }
]

def get_oracle_history(w3, contract):
    """
    Get the latest round data for a specific oracle
    
    Args:
        w3 (Web3): Web3 connection instance
        contract (Contract): Oracle contract instance
    
    Returns:
        tuple: Information about the latest round
    """
    try:
        round_data = contract.functions.latestRoundData().call()
        
        # Extract the updatedAt timestamp (4th output)
        updatedAt = round_data[3]
        current_timestamp = int(time.time())
        update_interval = int(os.getenv('UPDATE_INTERVAL', 3600))

        # Check if we need to sleep
        if (current_timestamp - updatedAt) < update_interval:
            remaining_time = update_interval - (current_timestamp - updatedAt)
            print(f"Sleeping for {remaining_time} seconds...")
            # time.sleep(remaining_time)
            return False
        
        print(f"Oracle Last Updated: {updatedAt}, Current Time: {current_timestamp}")
        print(f"Time Since Last Update: {current_timestamp - updatedAt} seconds")
        
        return True #round_data
    except Exception as e:
        print(f"Error fetching oracle history: {e}")
        return False

def transmit_value(w3, contract, private_key):
    """
    Transmit update to a specific oracle
    
    Args:
        w3 (Web3): Web3 connection instance
        contract (Contract): Oracle contract instance
        private_key (str): Private key for transaction signing
    
    Returns:
        dict: Transaction receipt
    """
    try:
        # Get the account from private key
        account = Account.from_key(private_key)

        # Build the transaction
        nonce = w3.eth.get_transaction_count(account.address)
        
        transaction = contract.functions.updateData().build_transaction({
            'chainId': w3.eth.chain_id,
            'gasPrice': w3.eth.gas_price,
            'nonce': nonce,
            'from': account.address,
        })
        
        # Sign the transaction
        signed_txn = w3.eth.account.sign_transaction(transaction, private_key)
        
        # Send the transaction
        tx_hash = w3.eth.send_raw_transaction(signed_txn.raw_transaction)
        print(f"Transaction sent! Hash: {tx_hash.hex()}")
        
        # Wait for the transaction receipt
        tx_receipt = w3.eth.wait_for_transaction_receipt(tx_hash)
        print(f"Transaction successful. Hash: {tx_hash.hex()}")
        return tx_receipt
    
    except Exception as e:
        print(f"An error occurred while transmitting value: {e}")
        raise

def main():
    # Get update interval from environment, default to 1 hour
    interval = int(os.getenv('UPDATE_INTERVAL', 3600))
    
    while True:
        try:
            # Iterate through each oracle configuration
            for oracle_config in ORACLE_CONFIGS:
                print(f"\nProcessing Oracle: {oracle_config['ORACLE_ADDRESS']}")
                
                # Initialize Web3 connection
                w3 = Web3(Web3.HTTPProvider(oracle_config['RPC_URL']))
                
                # Set up the contract
                contract = w3.eth.contract(
                    address=oracle_config['ORACLE_ADDRESS'], 
                    abi=TARGET_ORACLE_ABI
                )
                
                # Get oracle history
                skip = get_oracle_history(w3, contract)

                if(not skip):
                    # Skip the update of the oracle
                    continue
                
                # Transmit update
                print("Transmitting value to oracle")
                receipt = transmit_value(
                    w3, 
                    contract, 
                    oracle_config['PRIVATE_KEY']
                )
                print(f"Transaction mined in block {receipt['blockNumber']}")
        
        except Exception as e:
            print(f"An error occurred in main loop: {e}")
        
        print(f"Sleeping for {interval/ len(ORACLE_CONFIGS)} seconds before next round of updates...")
        time.sleep(interval/ len(ORACLE_CONFIGS))

if __name__ == "__main__":
    print('Multi-Oracle Price Updater is live')
    main()
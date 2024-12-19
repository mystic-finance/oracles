
deploy-offchain-agg :; forge script scripts/DeployOffchain.s.sol:DeployOracleScript --chain 18230 --rpc-url plume2 --broadcast --legacy --slow --sender 0x0fbAecF514Ab7145e514ad4c448f417BE9292D63 --delay 5 -vvv
deploy-oracle :; forge script scripts/DeployEACProxy.s.sol:DeployEACOracleScript --chain 18230 --rpc-url plume2 --broadcast --legacy --slow --gas-estimate-multiplier 150 --sender 0x0fbAecF514Ab7145e514ad4c448f417BE9292D63 --delay 5 -vvv
deploy-emeg-oracle :; forge script scripts/DeployEEACProxy.s.sol:DeployEACOracleScript --chain 18230 --rpc-url plume2 --broadcast --legacy --slow --sender 0x0fbAecF514Ab7145e514ad4c448f417BE9292D63 --delay 5 -vvv
deploy-offchain-devnet :; forge script scripts/DeployOffchain.s.sol:DeployOracleScript --chain 98864 --rpc-url plume3 --broadcast --legacy --slow --gas-estimate-multiplier 5000 --sender 0x0fbAecF514Ab7145e514ad4c448f417BE9292D63 --delay 5 -vvv 
deploy-oracle-devnet :; forge script scripts/DeployEACProxy.s.sol:DeployEACOracleScript --chain 98864 --rpc-url plume3 --broadcast --legacy --slow --gas-estimate-multiplier 5000 --sender 0x0fbAecF514Ab7145e514ad4c448f417BE9292D63 --delay 5 -vvv
deploy-supra-oracle-devnet :; forge script scripts/DeploySupraEACProxy.s.sol:DeploySupraEACOracleScript --chain 98864 --rpc-url plume3 --broadcast --legacy --slow --sender 0x0fbAecF514Ab7145e514ad4c448f417BE9292D63 --delay 5 --gas-estimate-multiplier 5000 -vvvvv
test-oracle-devnet :; forge script scripts/Offchain.s.sol:TransmitScript --chain 98864 --rpc-url plume3 --broadcast --legacy --slow --delay 5 -vvvv


deploy-offchain-arb :; forge script scripts/DeployOffchain.s.sol:DeployOracleScript --chain 42161 --rpc-url arbitrum --broadcast --legacy --slow --gas-estimate-multiplier 120 --sender 0x0fbAecF514Ab7145e514ad4c448f417BE9292D63 --delay 5 -vvv 
deploy-oracle-arb :; forge script scripts/DeployEACProxy.s.sol:DeployEACOracleScript --chain 42161 --rpc-url arbitrum --broadcast --legacy --slow --gas-estimate-multiplier 120 --sender 0x0fbAecF514Ab7145e514ad4c448f417BE9292D63 --delay 5 -vvv
test-oracle-arb :; forge script scripts/Offchain.s.sol:TransmitScript --chain 42161 --rpc-url arbitrum --broadcast --legacy --slow --delay 5 -vvvv

# mainnet
deploy-supra-oracle-mainnet :; forge script scripts/DeploySupraEACProxy.s.sol:DeploySupraEACOracleScript --chain 98865 --rpc-url plume_mainnet --broadcast --legacy --slow --delay 5 --gas-estimate-multiplier 5000 -vvvvv
test-oracle-mainnet :; forge script scripts/Offchain.s.sol:TransmitScript --chain 98865 --rpc-url plume_mainnet --broadcast --legacy --slow --delay 5 -vvvv


deploy-offchain-plume :; forge script scripts/DeployOffchain.s.sol:DeployOracleScript --chain 98865 --rpc-url plume_mainnet --broadcast --legacy --slow --gas-estimate-multiplier 5000 --delay 5 -vvv 
deploy-oracle-plume :; forge script scripts/DeployEACProxy.s.sol:DeployEACOracleScript --chain 98865 --rpc-url plume_mainnet --broadcast --legacy --slow --gas-estimate-multiplier 5000 --delay 5 -vvv
test-oracle-plume :; forge script scripts/Offchain.s.sol:TransmitScript --chain 98865 --rpc-url plume_mainnet --broadcast --legacy --slow --delay 5 -vvvv


test-oracle :; forge script scripts/Offchain.s.sol:TransmitScript --chain 18230 --rpc-url plume2 --broadcast --legacy --slow --gas-estimate-multiplier 150 --sender 0x0fbAecF514Ab7145e514ad4c448f417BE9292D63 --delay 5 -vvvv
test-oracle-devnet :; forge script scripts/Offchain.s.sol:TransmitScript --chain 98864 --rpc-url plume3 --broadcast --legacy --slow --gas-estimate-multiplier 5000 --sender 0x0fbAecF514Ab7145e514ad4c448f417BE9292D63 --delay 5 -vvvv

run-updater :;  python offchain-updater-coingecko.py

verify-oracle :; forge verify-contract 0x59AB56F7285e723CD417aFf63EEea800fD037995 --chain 137 --verifier etherscan --etherscan-api-key XTQMYH2JDHAMKD4CQW8TV3QPR2RUAP8M6M --rpc-url polygon src/EmergencyEACProxy.sol:EEACAggregatorProxy --watch --constructor-args 0x00000000000000000000000036da71ccad7a67053f0a4d9d5f55b725c9a25a3e000000000000000000000000000000000000000000000000000000000000000021c4f9a7edaefc4d28ba07193e0a7f13858fc363002378434608f3296ae1c676
verify-oracle-arb :; forge verify-contract 0x9BCAb090873aE5f2200DCF1Eb51EE0684D82B27C --chain 42161 --verifier etherscan --etherscan-api-key ENGNSHDPQBMAP5Y7MQV7RK1VZQ1AVDAQ9K --rpc-url arbitrum src/EACAggregatorProxy.sol:EACAggregatorProxy --watch --constructor-args 0x0000000000000000000000007d5524041a6630352c761ddbb360226e0e6140ef0000000000000000000000000000000000000000000000000000000000000000
verify-supra-oracle-1 :; forge verify-contract 0x5cE034374a7E62e42a1816C00A631437317a8eF9 --chain 98865 --verifier blockscout --verifier-url 'https://phoenix-explorer.plumenetwork.xyz/api?' --rpc-url plume_mainnet src/SupraEACProxy.sol:SupraEACAggregatorProxy --watch --constructor-args 0x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000063176fd4de041657352e9f7ddef86189436fd48f000000000000000000000000070e2cc12542636570de4b3e96a513e12a14aa0f000000000000000000000000000000000000000000000000000000000000005900000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000
verify-supra-oracle-2 :; forge verify-contract 0x9025Ea91308E0A55980e8cA6339026d3d662EB00 --chain 98865 --verifier blockscout --verifier-url 'https://phoenix-explorer.plumenetwork.xyz/api?' --rpc-url plume_mainnet src/SupraEACProxy.sol:SupraEACAggregatorProxy --watch --constructor-args 0x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000063176fd4de041657352e9f7ddef86189436fd48f000000000000000000000000070e2cc12542636570de4b3e96a513e12a14aa0f000000000000000000000000000000000000000000000000000000000000002e00000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000
verify-supra-oracle-3 :; forge verify-contract 0xA2B05F84130Ee6a6F324BFFaA7FF9fA32305c21e --chain 98865 --verifier blockscout --verifier-url 'https://phoenix-explorer.plumenetwork.xyz/api?' --rpc-url plume_mainnet src/SupraEACProxy.sol:SupraEACAggregatorProxy --watch --constructor-args 0x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000063176fd4de041657352e9f7ddef86189436fd48f000000000000000000000000070e2cc12542636570de4b3e96a513e12a14aa0f000000000000000000000000000000000000000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000


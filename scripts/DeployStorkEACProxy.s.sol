// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import "../src/StorkEACProxy.sol";

// interface AccessControllerInterface {
//   function hasAccess(address user, bytes calldata data) external view returns (bool);
// }

contract DeployStorkEACOracleScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // address contractAddress = 0x36dA71ccAd7A67053f0a4d9D5f55b725C9A25A3E;

        // address operator = vm.envAddress("OPERATOR");

        vm.startBroadcast(deployerPrivateKey);
        // console.log(address(0));
        // 0x9a68bf813c4f42498a00597525d381d80500754063da6653451332de9ec33900 - nrwa
        // 0x03dc21360613cf5a4dc6e10336668aaa4e1d2fcd6951317da5de8760bc462c56 - stone
        // 0x18fddef43d68963e9041e7a0c0a33379841cc97b553988c84eb1e28fba6fe2c7 - nyield
        // 0x2647985caf5516af21b0304b2acb77986d1eeea2c8bf3a5866cd5ae8d8e59926 - ntbill

        // StorkEACAggregatorProxy oracleNRWA = new StorkEACAggregatorProxy(address(0),0x9a68bf813c4f42498a00597525d381d80500754063da6653451332de9ec33900, 0xacC0a0cF13571d30B4b8637996F5D6D774d4fd62); //nRWA
        // StorkEACAggregatorProxy oracleNTBill = new StorkEACAggregatorProxy(address(0),0x2647985caf5516af21b0304b2acb77986d1eeea2c8bf3a5866cd5ae8d8e59926, 0xacC0a0cF13571d30B4b8637996F5D6D774d4fd62); // plume
        // StorkEACAggregatorProxy oracleNElixir = new StorkEACAggregatorProxy(address(0),0x8afba5f1a5d4969d23c3b42db1b88f8a9c8176392de5bf066752260478ce82b8, 0xacC0a0cF13571d30B4b8637996F5D6D774d4fd62); // pusd
        StorkEACAggregatorProxy oracleUSDC = new StorkEACAggregatorProxy(address(0),0x7416a56f222e196d0487dce8a1a8003936862e7a15092a91898d69fa8bce290c, 0xacC0a0cF13571d30B4b8637996F5D6D774d4fd62); // pusd
        StorkEACAggregatorProxy oracleUSDT = new StorkEACAggregatorProxy(address(0),0x6dcd0a8fb0460d4f0f98c524e06c10c63377cd098b589c0b90314bfb55751558, 0xacC0a0cF13571d30B4b8637996F5D6D774d4fd62);
        StorkEACAggregatorProxy oraclePETH = new StorkEACAggregatorProxy(address(0),0xe4230bc1e94312c4b57a311c5e3bf5b6a42564ddc1ea7e7edb004180036341c2, 0xacC0a0cF13571d30B4b8637996F5D6D774d4fd62);

        
        // console.log("New Oracle Address:", address(oracleNRWA));
        // console.log("New Oracle Address:", address(oracleNTBill));
        // console.log("New Oracle Address:", address(oracleNElixir));
        console.log("New Oracle Address USDC:", address(oracleUSDC));
        console.log("New Oracle Address USDT:", address(oracleUSDT));
        console.log("New Oracle Address PETH:", address(oraclePETH));

        vm.stopBroadcast();
    }
}

// WBTC 0x830ED9E3461667BAE2765131Ae784dd307a24fBF
// WETH 0x59AB56F7285e723CD417aFf63EEea800fD037995

// stone 0x7f527879a534055C788d00dC4fa41715b9Cf1546
// nyield 0xc17A694B1B0C19019DCdb6B6Af799E97435bF662
// ntbill 0xa413Fa39f979b62d9dcB657301BD4f876451A3A5
// nElixir 


// plume 0xBDCF5dcd60F967C2f8c79AFD1CE7C9F1A11f9f04
// pusd 0x0D9154F5453dCb0a271D9FF415Abc085d7B03b6c



// new plume mainnet
// nrwa 0xd411131B1Efc61006fc249D67C7BDD61fcd368F4
// ntbill 0x69b8Fcb74a5FbcCddE7bDb9b7Ec59a8Cb1AA5e2C
// nelixir 0x42D4bf80e77114eBB049CBea29E1AB5A0727e9CA
// weth 0x8De37B451C353AA6EEAc39dc28B6Ee82554BBa55
// New Oracle Address USDC: 0xE55ab85986C832CbC27C9f26054153023c199Cf4
// New Oracle Address USDT: 0x1F263995486a9aCfD648D6Cff5206f090c54470f
// New Oracle Address PETH: 0x8aC34D137daac9F47a5F9a93C429F0c7324c70da
// plume 0xBDCF5dcd60F967C2f8c79AFD1CE7C9F1A11f9f04
// pusd 0x0D9154F5453dCb0a271D9FF415Abc085d7B03b6c

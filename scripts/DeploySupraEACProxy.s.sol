// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import "../src/SupraEACProxy.sol";

// interface AccessControllerInterface {
//   function hasAccess(address user, bytes calldata data) external view returns (bool);
// }

contract DeploySupraEACOracleScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // address contractAddress = 0x36dA71ccAd7A67053f0a4d9D5f55b725C9A25A3E;

        // address operator = vm.envAddress("OPERATOR");

        vm.startBroadcast(deployerPrivateKey);
        // console.log(address(0));

        SupraEACAggregatorProxy oracleEth = new SupraEACAggregatorProxy(address(0), 0x63176Fd4dE041657352E9f7DdEF86189436fD48f, 0x070e2cC12542636570De4b3E96a513E12A14AA0F, 89, "0x"); //WETH
        
        // console.log("New Oracle Address:", address(oracleEth));

        vm.stopBroadcast();
    }
}

// WBTC 0x830ED9E3461667BAE2765131Ae784dd307a24fBF
// WETH 0x59AB56F7285e723CD417aFf63EEea800fD037995
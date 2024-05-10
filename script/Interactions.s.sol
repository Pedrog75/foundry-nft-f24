// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script} from 'forge-std/Script.sol';
import {DevOpsTools} from 'lib/foundry-devops/src/DevOpsTools.sol';
import {BasicNft} from '../src/BasicNft.sol';

contract MintBasicNft is Script {
  string public constant PEPITO = "https://ipfs.io/ipfs/Qmf4ptUfRKiaJw4iF49dUDqq3K18Sg7tBeRcVaQiGCDau8?filename=pepitoc.gif";

  function run() external{
    address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
      "BasicNft", block.chainid
      );
    mintNftOnContract(mostRecentlyDeployed);

  }
  function mintNftOnContract(address contractAddress) public{
    vm.startBroadcast();
    BasicNft(contractAddress).mintNft(PEPITO);
    vm.stopBroadcast();
  }
}

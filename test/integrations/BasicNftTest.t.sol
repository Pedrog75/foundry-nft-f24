// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;
import {Test} from 'forge-std/Test.sol';
import {DeployBasicNft} from '../../script/DeployBasicNft.s.sol';
import {BasicNft} from '../../src/BasicNft.sol';

contract BasicNftTest is Test {
  DeployBasicNft public deployer;
  BasicNft public basicNft;
  address public USER = makeAddr("user");
  string public constant PEPITO = "https://ipfs.io/ipfs/Qmf4ptUfRKiaJw4iF49dUDqq3K18Sg7tBeRcVaQiGCDau8?filename=pepitoc.gif";

  function setUp() public{
      deployer = new DeployBasicNft();
      basicNft = deployer.run();
  }

  function testNAmeIsCorrect() public view{
    string memory expectedName = "Doggo";
    string memory actualName = basicNft.name();
    bytes memory encodedName = abi.encodePacked(expectedName);
    bytes memory encodedActualName = abi.encodePacked(actualName);
    bytes32 expectedNameHash = keccak256(encodedName);
    bytes32 actualNameHash = keccak256(encodedActualName);
    assert(expectedNameHash == actualNameHash);
  }

  function testCanMintAndHaveABalance() public{
    vm.prank(USER);
    basicNft.mintNft(PEPITO);

    assert(basicNft.balanceOf(USER) == 1);
    assert(keccak256(abi.encodePacked(PEPITO)) == keccak256(abi.encodePacked(basicNft.tokenURI(0))));
  }
}

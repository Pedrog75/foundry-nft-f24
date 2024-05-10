// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;
import {Test, console} from 'forge-std/Test.sol';
import {DeployMoodNft} from '../script/DeployMoodNft.s.sol';
import {MoodNft} from '../src/MoodNft.sol';

contract DeployMoodNftTest is Test {
  DeployMoodNft public deployer;
  function setUp() public {
    deployer = new DeployMoodNft();

  }
  function testConvertSvgToImageUri() public view{
    string memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj4KPHRleHQgeD0iMCIgeT0iMTUiIGZpbGw9ImJsYWNrIj4gaGkhIFlvdSBkZWNvZGVkIHRoaXMhPC90ZXh0Pgo8L3N2Zz4K=";
    string memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text x="0" y="15" fill="black"> hi! You decoded this!</text></svg>';
    string memory actualUri = deployer.svgToImageURI(svg);
    assert(keccak256(abi.encodePacked(actualUri)) == keccak256(abi.encodePacked(expectedUri)));
  }
}

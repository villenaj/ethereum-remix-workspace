// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.31;

import { PriceConverter } from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 5e18;
    address[] public funders;
    mapping(address funders => uint256 amount) public listOfFunders;
    
    function fund() public payable {
        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough ETH");
        funders.push(msg.sender);
        listOfFunders[msg.sender] += msg.value;
    }

    function withdraw() public {}
}
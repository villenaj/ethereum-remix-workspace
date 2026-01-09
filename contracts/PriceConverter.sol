// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.31;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice() internal view returns(uint256) {
        // 0x72AFAECF99C9d9C8215fF44C77B94B99C28741e8
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x72AFAECF99C9d9C8215fF44C77B94B99C28741e8);
        (, int256 price,,,) = priceFeed.latestRoundData();

        return uint256(price) * 1e10;
    }

    function getConversionRate(uint256 _ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * _ethAmount) / 1e18;

        return ethAmountInUsd;
    }
}
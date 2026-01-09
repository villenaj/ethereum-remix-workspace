// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.31;

import { SimpleStorage } from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _contractIndex, uint256 _favoriteNumber) public {
        listOfSimpleStorageContracts[_contractIndex].store(_favoriteNumber);
    }

    function sfGet(uint256 _contractIndex) public view returns(uint256) {
        return listOfSimpleStorageContracts[_contractIndex].retrieve();
    }
}
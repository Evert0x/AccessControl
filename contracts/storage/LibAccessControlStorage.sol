// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.7.4;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/EnumerableSet.sol";
import "@openzeppelin/contracts/utils/Address.sol";

library LibAccessControlStorage {
    bytes32 constant ACCESS_STORAGE_POSITION = keccak256(
        "diamond.standard.access.storage"
    );

    struct RoleStorage {
        uint256 memberCounter;
        mapping(bytes32 => RoleData) roles;
        mapping(address => uint256) addressToMember;
        mapping(uint256 => address) memberToAddress;
    }

    struct RoleData {
        EnumerableSet.UintSet members;
        bytes32 adminRole;
    }
}

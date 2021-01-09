// SPDX-License-Identifier: MIT
// source: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/AccessControl.sol

pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/utils/EnumerableSet.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "./storage/LibAccessStorage.sol";
import "./interfaces/IAccessControl.sol";
import "./AccessControlMemberIDInternal.sol";
import "./RelayReceiver.sol";

contract AccessControlMemberID is
    AccessControlMemberIDInternal,
    IAccessControl
{
    using EnumerableSet for EnumerableSet.AddressSet;
    using Address for address;

    function hasRole(bytes32 role, address account)
        external
        override
        view
        returns (bool)
    {
        return _hasRole(role, account);
    }

    function getRoleMemberCount(bytes32 role)
        external
        override
        view
        returns (uint256)
    {
        return LibAccessStorage.roleStorage().roles[role].members.length();
    }

    function getRoleMember(bytes32 role, uint256 index)
        external
        override
        view
        returns (address)
    {
        return LibAccessStorage.roleStorage().roles[role].members.at(index);
    }

    function getRoleAdmin(bytes32 role)
        external
        override
        view
        returns (bytes32)
    {
        return LibAccessStorage.roleStorage().roles[role].adminRole;
    }

    function grantRole(bytes32 role, address account) external override {
        require(
            _hasRole(
                LibAccessStorage.roleStorage().roles[role].adminRole,
                _msgSender()
            ),
            "AccessControl: sender must be an admin to grant"
        );
        _grantRole(role, account);
    }

    function revokeRole(bytes32 role, address account) external override {
        require(
            _hasRole(
                LibAccessStorage.roleStorage().roles[role].adminRole,
                _msgSender()
            ),
            "AccessControl: sender must be an admin to revoke"
        );
        _revokeRole(role, account);
    }

    function renounceRole(bytes32 role, address account) external override {
        require(
            account == _msgSender(),
            "AccessControl: can only renounce roles for self"
        );
        _revokeRole(role, account);
    }
}

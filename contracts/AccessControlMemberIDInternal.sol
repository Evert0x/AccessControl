// SPDX-License-Identifier: MIT
// source: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/AccessControl.sol

pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/utils/EnumerableSet.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "./storage/LibAccessStorage.sol";
import "./RelayReceiver.sol";
import "./interfaces/IAccessControlEvents.sol";

contract AccessControlMemberIDInternal is IAccessControlEvents, RelayReceiver {
    using EnumerableSet for EnumerableSet.AddressSet;
    using Address for address;

    function _hasRole(bytes32 role, address account)
        internal
        virtual
        view
        returns (bool)
    {
        LibAccessStorage.RoleStorage storage rs = LibAccessStorage
            .roleStorage();

        return rs.roles[role].members.contains(account);
    }

    function _setupRole(bytes32 role, address account) internal virtual {
        _grantRole(role, account);
    }

    function _setRoleAdmin(bytes32 role, bytes32 adminRole) internal virtual {
        LibAccessStorage.RoleStorage storage rs = LibAccessStorage
            .roleStorage();

        emit RoleAdminChanged(role, rs.roles[role].adminRole, adminRole);
        rs.roles[role].adminRole = adminRole;
    }

    function _grantRole(bytes32 role, address account) internal virtual {
        LibAccessStorage.RoleStorage storage rs = LibAccessStorage
            .roleStorage();

        if (rs.roles[role].members.add(account)) {
            emit RoleGranted(role, account, _msgSender());
        }
    }

    function _revokeRole(bytes32 role, address account) internal virtual {
        LibAccessStorage.RoleStorage storage rs = LibAccessStorage
            .roleStorage();

        if (rs.roles[role].members.remove(account)) {
            emit RoleRevoked(role, account, _msgSender());
        }
    }
}

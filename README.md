# Member access control

An implementation of an access control module (TMP-1)

This implementation assigns member ids (uint256) to members with a mapping to an address and vica versa. This allows a members address to be updated during the lifecycle of a pool.

## Testing

`yarn install`

`npx hardhat test`

## Depends on

- Relay Receiver

Exposing internal interface

```
    function _hasRole(bytes32 role, address account)
        internal
        virtual
        view
        returns (bool);

    function _setupRole(bytes32 role, address account) internal virtual;

    function _setRoleAdmin(bytes32 role, bytes32 adminRole) internal virtual;

    function _grantRole(bytes32 role, address account) internal virtual;

    function _revokeRole(bytes32 role, address account) internal virtual;
```

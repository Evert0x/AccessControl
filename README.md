# Access control

An implementation of an access control module (TMP-1)

Based on the openzeppeling implementation

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

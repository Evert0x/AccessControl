# Member access control

An implementation of an access control module (TMP-1)

This implementation assigns member ids (uint256) to members with a mapping to an address and vica versa. This allows a members address to be updated during the lifecycle of a pool.

## Testing

`yarn install`

`npx hardhat test`
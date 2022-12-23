pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";
contract test {

    function a(bytes memory signature) public view returns(address){
        bytes32 digest = ECDSA.toEthSignedMessageHash(b());
        address _signer = ECDSA.recover(digest, signature);
        return _signer;
    }

    function b() public view returns(bytes32) {
        address _to = 0x6dfc34609a05bC22319fA4Cce1d1E2929548c0D7;
        uint badgeId = 1;
        bytes32 digest = keccak256(
                abi.encode(
                    _to,
                    badgeId
                )
            );
            return digest;
    }
    function c(bytes32 digest ,bytes memory signature) public view returns (address) {
          bytes32 digest = ECDSA.toEthSignedMessageHash(digest);
          address _signer = ECDSA.recover(digest, signature);
          return _signer;
    }
}

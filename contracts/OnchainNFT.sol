//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.28;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract OnChainNFT is ERC721URIStorage {
    using Strings for uint256;

    uint256 private _tokenIdCounter;

    constructor() ERC721("KNFT","KT") {
        _tokenIdCounter = 1;
    }


    function mint() public {
        _safeMint(msg.sender,  _tokenIdCounter , "");
        _tokenIdCounter++;
    }
    function tokenURI(uint256 tokenId) public view  override returns (string memory){
        ownerOf(tokenId);
        string memory name = string(abi.encodePacked("OnchainNFT  #" , tokenId.toString()));
        string memory description = "This ia an NFT created by Kenny";
        string memory image = generateImage();
        string memory json = Base64.encode(bytes(
        string(abi.encodePacked(
                '{"name": "', name, '",',
                '"description": "', description, '",',
                '"image": "data:image/svg+xml;base64,', image, '"}'
            )
        )
    )
);
    return string(abi.encodePacked("data:application/json;base64,",json));

    }
    function generateImage() internal pure returns(string memory) {
        string memory svg = "<svg width='300' height='300' xmlns='http://www.w3.org/2000/svg'>"
            "<rect width='100%' height='100%' fill='green'/>"
            "<text x='50%' y='50%' font-size='24' fill='white' dominant-baseline='middle' text-anchor='middle'>"
            "OnchainNFT"
            "</text></svg>";

      return Base64.encode(bytes(svg));
    }
}

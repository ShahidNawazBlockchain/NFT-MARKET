// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "hardhat/console.sol";
contract NFT_MarketPlace is ERC721URIStorage {
   using Counters for Counters.Counter;

   Counters.Counter private _tokenIds;
   Counters.Counter private _itemsSold;

   address payable owner;
   mapping (uint256 => MarketItem) private idMarketItem;

   struct MarketItem {
      uint256 tokenId;
      address payable seller;
      address payable owner;
      uint256 price;
      bool sold;
   }
}
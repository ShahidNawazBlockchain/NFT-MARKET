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
   uint256 listingPrice=0.0025 ether;
   address payable owner;
   mapping (uint256 => MarketItem) private idMarketItem;

   struct MarketItem {
      uint256 tokenId;
      address payable seller;
      address payable owner;
      uint256 price;
      bool sold;
   }

   event idMarketItemCreated(
    uint256 indexed tokenId,
    address seller,
    address owner,
    uint256 price,
    bool,
   );
   modifier  onlyOwner {
    require(msg.sender==owner,"Only owner of the marketplace can change the listing price");
    _;
   }

   constructor() ERC721("NFT Metavarse Token","ArtBlocksHubNFT"){
    owner=payable(msg.sender);
   }

function updateListingPrice(uint256 _ListingPrice)
public
 payable
  onlyOwner
   {
    listingPrice=_ListingPrice;
    }














}
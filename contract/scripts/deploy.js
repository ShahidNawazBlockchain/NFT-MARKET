const hre = require("hardhat");
async function main() {

  
  const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  // const unlockTime = currentTimestampInSeconds + 60;
  const unlockTime = 1710193808;

   const lockedAmount = hre.ethers.utils.parseEther("0.001");

  const NFT_MarketPlace = await hre.ethers.deployContract("NFT_MarketPlace");
  await NFT_MarketPlace.deployed()

  console.log(
    `NFT MarketPlace with ${hre.ethers.utils.formatEther(
      lockedAmount
    )} ETH and  timestamp ${unlockTime} deployed to ${NFT_MarketPlace.address}`
  );


  console.log("verification process...")

  await run("verify:verify", {
    address: NFT_MarketPlace.address,
    contract: "contracts/NFT_MarketPlace.sol:NFT_MarketPlace", 
    constructorArguments: [],
});
 
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});


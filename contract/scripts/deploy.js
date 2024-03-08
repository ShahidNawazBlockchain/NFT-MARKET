const hre = require("hardhat");

async function main() {
  const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  const unlockTime = currentTimestampInSeconds + 60;

   const lockedAmount = hre.ethers.utils.parseEther("0.001");

  const NFT_MarketPlace = await hre.ethers.deployContract("NFT_MarketPlace");
  await NFT_MarketPlace.deployed()

  console.log(
    `NFT MarketPlace with ${hre.ethers.utils.formatEther(
      lockedAmount
    )} ETH and  timestamp ${unlockTime} deployed to ${NFT_MarketPlace.address}`
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});


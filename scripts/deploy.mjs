import { ethers } from "hardhat";

async function main() {
  const MyToken = await ethers.getContractFactory("MyToken");

  const token = await MyToken.deploy(1_000_000);
  await token.waitForDeployment();

  console.log("MyToken deployed to:", await token.getAddress());
}

main().catch((e) => {
  console.error(e);
  process.exitCode = 1;
});

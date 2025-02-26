import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const OnchainNFTModule = buildModule("OnchainNFTModule", (m) => {
  const onchain = m.contract("OnChainNFT");

  return  { onchain };
});

export default OnchainNFTModule;




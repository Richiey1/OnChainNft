import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const OnChainNFTModule = buildModule("OnChainNFTModule", (m) => {
  const onchain = m.contract("OnChainNFT");

  return  {onchain };
});

export default OnChainNFTModule;




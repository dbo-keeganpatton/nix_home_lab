{ ... }:

{
  imports = [
    ../../modules/k3s/agent.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "hydra-5";
}

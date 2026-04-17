{ ... }:

{
  imports = [
    ../../modules/k3s/server.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "hydra-1"; 
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.networkmanager.enable = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  services.k3s.clusterInit = true;

  users.users.eyelady = {
    isNormalUser = true;
    extraGroups = [ "wheel" "sudo" ]; 
  };

  environment.sessionVariables = {
	  KUBECONFIG = "/etc/rancher/k3s/k3s.yaml";
  };

  environment.systemPackages = with pkgs; [
      kubernetes-helm
      fastfetch
      btop
      neovim
      vim     
      wget
  ];

  #########################
  #     K8 & SSH support  #
  #########################
  services.openssh.enable = true;
  system.stateVersion = "25.11";

}

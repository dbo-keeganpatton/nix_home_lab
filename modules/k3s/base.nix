
{ pkgs, ... }:

{
  services.k3s = {
    enable = true;
    tokenFile = "/run/secrets/k3s-token";
    package = pkgs.k3s;
  };

  system.activationScripts.k3sToken = ''
    mkdir -p /run/secrets
    cp /etc/secrets/k3s-token /run/secrets/k3s-token
    chmod 600 /run/secrets/k3s-token
  '';

  networking.firewall.allowedTCPPorts = [ 6443 ];
  networking.firewall.allowedUDPPorts = [ 8472 ];

}


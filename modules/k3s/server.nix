
{ ... }:

{
  imports = [ ./base.nix ];
  services.k3s = { role = "server"; };
  networking.firewall.allowedTCPPorts = [ 3000 ];
}


{
  description = "Hydra cluster";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }:
  let
    system-x86 = "x86_64-linux";
  in {

    nixosConfigurations = {


      hydra-1 = nixpkgs.lib.nixosSystem {
        system = system-x86;
        modules = [./hosts/hydra_1/hydra-1.nix];
      };

      hydra-2 = nixpkgs.lib.nixosSystem {
        system = system-x86;
        modules = [./hosts/hydra_2/hydra-2.nix];
      };

      hydra-5 = nixpkgs.lib.nixosSystem {
        system = system-x86;
        modules = [./hosts/hydra_5/hydra-5.nix];
      };


    };
  };
}


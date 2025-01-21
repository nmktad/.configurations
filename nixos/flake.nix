{
  description = "nmktad's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    systems.url = "github:nix-systems/default-linux";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nixos-wsl, nixos-hardware, home-manager, ... }:
    let
      vars = import ./config/vars.nix { inherit (nixpkgs) lib; };

      mkHomeManagerModule = { config, ... }: {
        home-manager = {
          useUserPackages = true;
          backupFileExtension = "backup";
          users.${vars.user.name} = {};
        };
      };

    in
    {
      nixosConfigurations = {
        nmktad = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs vars;
            outputs = self;
          };
          modules = [
            nixos-wsl.nixosModules.default
            ./hosts/nmktad
            inputs.stylix.nixosModules.stylix
            inputs.home-manager.nixosModules.home-manager
            mkHomeManagerModule
          ];
        };
      };
    };
}
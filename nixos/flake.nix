{
  description = "nmktad's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix/release-24.11";

    nur.url = "github:nix-community/NUR";

    dotfiles = {
      url = "git+https://github.com/nmktad/.dotfiles.git";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nixos-wsl, nixos-hardware, home-manager, dotfiles, ... }:
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
        nmktad = nixpkgs-unstable.lib.nixosSystem {
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

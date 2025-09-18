{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-25.05";

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    disko,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      # sources = import ./npins;
    in {
      formatter = pkgs.alejandra;

      nixosConfigurations = {
        anywhere_config = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            device_name = ""; # Must be changed
            swap_size = 0; # Must be changed
            ssh_keys = []; # Must be changed
            host_name = ""; # Must be changed
          };
          system = system;
          modules = [
            disko.nixosModules.disko
            ./hosts/anywhere/configuration.nix
            ./hosts/anywhere/hardware-configuration.nix
          ];
        };
      };

      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
        ];
      };
    });
}

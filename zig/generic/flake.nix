{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-25.05";

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    flake-compat = {
      url = "github:edolstra/flake-compat";
      # flake = false;
    };

    zig = {
      url = "github:mitchellh/zig-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
        flake-compat.follows = "flake-compat";
      };
    };

    zon2nix = {
      url = "github:jcollie/zon2nix?rev=dc78177e2ad28d5a407c9e783ee781bd559d7dd5";
      inputs = {
        # Don't override nixpkgs until Zig 0.15 is available in the Nix branch
        # we are using for "normal" builds.
        #
        # nixpkgs.follows = "nixpkgs";
      };
    }; 
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:   
      flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
      };
      zig = inputs.zig.packages.${system}."0.15.1";
      # sources = import ./npins;
    in {
      formatter = pkgs.alejandra;

      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          (zig)
          # zls TODO: best to build from branch same as zig overlay
          mkdocs
        ];
      };
    });
}

{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";

    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    ...
  }: let
    systems = ["x86_64-linux"];
  in
    inputs.flake-utils.lib.eachSystem systems (system: let
      pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
      };
      # sources = import ./npins;
    in {
      formatter = pkgs.alejandra;

      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
        ];
      };

      templates = rec {
        default = generic;

        generic = {
          path = ./generic;
          description = "generic template";
        };

        frontend-typescript-bun-svelte = {
          path = ./frontend/typescript/bun-svelte;
          description = "typescript-bun-svelte template";
        };
      };
    });
}

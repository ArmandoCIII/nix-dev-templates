{
  description = "A very basic flake";

  outputs = inputs @ {
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
          bun
          typescript
          tailwindcss
          mkdocs
        ];
      };
    });

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    /*
    The following will be further investigated to determine if it is
    reliable and safe and worth it.

    bun2nix = {
      url = "github:baileyluTCD/bun2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    */

    # self.submodules = true;
  };
}

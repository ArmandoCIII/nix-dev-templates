{
  description = "A very basic flake";

  outputs = inputs @ {
    self,
    nixpkgs,
    bun2nix,
    ...
  }: let
    systems = ["x86_64-linux"];
  in
    inputs.flake-utils.lib.eachSystem systems (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
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
    nixpkgs.url = "github:nixos/nixpkgs/release-25.11";

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    bun2nix = {
      url = "github:baileyluTCD/bun2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}

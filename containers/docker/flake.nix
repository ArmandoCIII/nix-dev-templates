{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.11";

    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
  let
    systems = ["x86_64-linux"];
  in
    flake-utils.lib.eachSystem systems (system: let
      pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
      };
  in {
    formatter = pkgs.alejandra;
    
    packages = {
      docker-image = import ./nix/docker/build-docker-image.template.nix {inherit pkgs;};
    };

  });
}

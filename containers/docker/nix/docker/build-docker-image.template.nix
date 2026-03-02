
{ pkgs, ... }:

# Generic Nix template for building Docker images
pkgs.dockerTools.buildLayeredImage {
  name = "docker-image"; # Change to your image name
  tag = "latest";        # Change to your desired tag
  contents = [
    pkgs.curl
    # pkgs.git
    # pkgs.nodejs
    # Add more packages as needed
  ];
}

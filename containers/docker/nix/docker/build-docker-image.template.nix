
{ pkgs, ... }:

# Generic Nix template for building Docker images
pkgs.dockerTools.buildImage {
  name = "docker-image"; # Change to your image name
  tag = "latest";        # Change to your desired tag
  contents = [
    # pkgs.curl
    # pkgs.git
    # pkgs.nodejs
    # Add more packages as needed
  ];
  config = {
    Cmd = [ "/bin/sh" ]; # Customize Docker CMD if needed
    # Add more Docker config options here
  };
}

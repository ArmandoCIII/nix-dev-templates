{
  lib,
  pkgs,
  inputs,
  ssh_keys,
  ...
}: {
  imports = [
    ./disk-config.nix
    ./hardware-configuration.nix
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking = {
    hostName = "nixos";
    firewall = {
      enable = true;
      allowedTCPPorts = [];
    };
  };

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  security.sudo.wheelNeedsPassword = false;

  services = {
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };

    jenkins.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [zsh];
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs;
    map lib.lowPrio [
      curl
      git
      btop
      jenkins
      jdk23_headless
    ];

  users.users = {
    root = {
      openssh.authorizedKeys.keys = ssh_keys;
    };
  };

  system.stateVersion = "25.05";
}

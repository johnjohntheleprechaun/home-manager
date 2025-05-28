{
  config,
  pkgs,
  ...
}: let
  unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
in {
  imports = [
    ./aws.nix
    ./bash.nix
    ./git.nix
    ./neovim
    ./tmux
    ./ssh
    ./kitty
  ];

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.aurulent-sans-mono
    unstable.uv

    nodejs_20
    nodePackages.aws-cdk
    nodePackages.http-server
    awscli2
    python3
    python311Packages.pip
    jdk21
    sshfs
    glib

    jq
  ];
}

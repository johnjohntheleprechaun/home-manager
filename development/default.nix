{
  config,
  pkgs,
  ...
}: let
  unstable =
    import (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
    }) {
      config = {
        allowUnfree = true;
      };
    };
in {
  imports = [
    ./aws.nix
    ./shell
    ./git
    ./neovim
    ./tmux
    ./ssh
    ./kitty
  ];

  home.packages = with pkgs; [
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

    # rust and rust-adjacent
    rustc
    rustfmt
    cargo
  ];
}

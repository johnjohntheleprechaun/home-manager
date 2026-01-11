{
  config,
  pkgs,
  unstable,
  ...
}: {
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

    nodePackages.aws-cdk
    nodePackages.http-server
    python3
    python311Packages.pip
    jdk21
    sshfs
    glib
    android-tools
    scrcpy

    jq
  ];
}

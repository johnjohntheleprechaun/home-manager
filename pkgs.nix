{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # GNOME extensions
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator

    # Graphical applications
    mumble
    tidal-hifi
    yubioath-flutter
    aws-sam-cli
    zoom-us
    gimp
    discord
    chromium
    vlc
    orca-slicer
    super-slicer
    godot_4
    blender
    nomacs
    audacity
    evince
    mumble

    # CLI packages
    croc
    s-tui
    stress
    usbutils
    zip
    unzip
    file
    ssh-import-id
    ffmpeg
    dig
    openssl
    binutils
    jq
    trash-cli
    rclone
    mitmproxy
    smartmontools
    rar
    htop-vim

    # Other shit
    ntfs3g
    exfatprogs
    iotop
  ];
  programs.chromium.enable = true;
}

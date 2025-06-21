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
    tidal-hifi
    yubioath-flutter
    aws-sam-cli
    zoom-us
    nautilus
    gnome-tweaks
    file-roller
    gnome-disk-utility
    gedit
    gimp
    discord
    chromium
    vlc
    orca-slicer
    godot_4
    blender
    nomacs
    audacity
    evince

    # CLI packages
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

    # Other shit
    ntfs3g
  ];
  programs.chromium.enable = true;
}

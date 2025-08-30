{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
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
    lsof
  ];
}

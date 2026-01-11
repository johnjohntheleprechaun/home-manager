{pkgs, ...}: {
  imports = [
    ./steam.nix
    ./minecraft.nix
  ];
  home.packages = with pkgs; [
    itch
    wine # for itch windows support
  ];
}

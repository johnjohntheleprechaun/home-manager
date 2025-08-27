{
  config,
  pkgs,
  ...
}: let
  nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
    inherit pkgs;
  };
  unstable = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  }) {
    config = {
      allowUnfree = true;
    };
  };
in {
  programs.firefox = {
    enable = true;
    package = unstable.firefox;
    profiles.john = {
      extensions.packages = with nur.repos.rycee.firefox-addons; [
        bitwarden
      ];
    };
  };
}

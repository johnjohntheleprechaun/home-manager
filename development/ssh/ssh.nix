{
  config,
  pkgs,
  ...
}: let
  hostMap = import ./host-mapper.nix;
  localVars = import ../../local/vars.nix;
in {
  programs.ssh = {
    enable = true;
    matchBlocks = hostMap {
      "leopard.local" = {
        hostname = "leopard";
        user = "john";
      };
      "tart.local" = {
        hostname = "tart";
        user = "pi";
      };
      "leopard.remote" = {
        hostname = "leopard-remote";
        port = 22;
        user = "john";
      };
      "tart.remote" = {
        hostname = "tart-remote";
        port = 22;
        user = "pi";
      };
      "noduh.mc" = {
        hostname = "mc.noduh.dev";
        port = 1822;
        user = "bob";
      };
      "john.noduh.mc" = {
        hostname = "mc.noduh.dev";
        port = 1822;
        user = "john";
      };
      "leprechaun.mc" = {
        hostname = "mc.leprechaun.dev";
        port = 1722;
        user = "john";
      };
    };
    extraOptionOverrides = {
      EnableEscapeCommandline = "true";
      AddKeysToAgent = "no";
      IdentityFile = localVars.sshKeyPath;
      ControlMaster = "auto";
      ControlPath = "~/.ssh/control/%h:%r";
      ControlPersist = "10m";
    };
  };
  home.file.".ssh/control/.keep".text = "can't create a directory without creating a file :/";
}

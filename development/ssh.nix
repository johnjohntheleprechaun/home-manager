{ config, pkgs, ... }:

let
    tmuxCommand = {
        extraOptions = {
            # automatically launch TMUX if it exists
            RemoteCommand = "bash -l -c 'tmux attach-session || tmux new-session'";
            RequestTTY = "yes";
            SetEnv = "TERM=xterm-256color";
        };
    };
in
{
    programs.ssh = {
        enable = true;
        matchBlocks = {
            "leopard.local" = {
                hostname = "leopard";
                user = "john";
            } // tmuxCommand;
            "rpi4.local" = {
                hostname = "johnpi";
                user = "pi";
            } // tmuxCommand;
            "leopard.remote" = {
                hostname = "leopard.van-pogona.ts.net";
                port = 22;
                user = "john";
            } // tmuxCommand;
            "rpi4.remote" = {
                hostname = "johnpi.van-pogona.ts.net";
                port = 22;
                user = "pi";
            } // tmuxCommand;
            "noduh.mc" = {
                hostname = "mc.noduh.dev";
                port = 1822;
                user = "bob";
            } // tmuxCommand;
            "john.noduh.mc" = {
                hostname = "mc.noduh.dev";
                port = 1822;
                user = "john";
            } // tmuxCommand;
            "raw.john.noduh.mc" = {
                hostname = "mc.noduh.dev";
                port = 1822;
                user = "john";
            };
        };
        extraOptionOverrides = {
            EnableEscapeCommandline = "true";
        };
    };
}

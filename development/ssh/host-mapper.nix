hostList: let
  tmuxCommand = {
    extraOptions = {
      ForwardAgent = "yes";
      # automatically launch TMUX if it exists
      RemoteCommand = "bash -l -c 'tmux attach-session || tmux new-session'";
      RequestTTY = "yes";
      SetEnv = "TERM=xterm-256color";
    };
  };
  pkgs = import <nixpkgs> {};
  lib = pkgs.lib;
in
  builtins.listToAttrs (
    lib.mapAttrsToList (name: value: {
      name = name + ".raw";
      value = value;
    })
    hostList
  )
  // (
    builtins.mapAttrs (name: value: value // tmuxCommand) hostList
  )

hostList: let
  tmuxCommand = {
    extraOptions = {
      # automatically launch TMUX if it exists
      RemoteCommand = "bash -l -c 'tmux attach-session || tmux new-session'";
      RequestTTY = "yes";
      SetEnv = "TERM=xterm-256color";
    };
  };
  agentForward = {
    extraOptions = {
      ForwardAgent = "yes";
    };
  };
  pkgs = import <nixpkgs> {};
  lib = pkgs.lib;
in
  builtins.listToAttrs (
    lib.mapAttrsToList (name: value: {
      name = name + ".raw";
      value = value // agentForward;
    })
    hostList
  )
  // (
    builtins.mapAttrs (name: value: value // agentForward // tmuxCommand) hostList
  )

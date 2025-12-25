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
in
  builtins.listToAttrs (
    builtins.attrValues (
      builtins.mapAttrs (name: value: {
        name = name + ".raw";
        value = value // agentForward;
      })
      hostList
    )
  )
  // (
    builtins.mapAttrs (name: value: value // agentForward // tmuxCommand) hostList
  )

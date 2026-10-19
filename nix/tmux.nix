{ config, ... }:

{
  programs.tmux = {
    enable = true;

    prefix = "C-s";
    baseIndex = 1;
    escapeTime = 0;
    focusEvents = true;
    mouse = true;

    extraConfig = ''
      set -g status off

      bind r source-file "${config.xdg.configHome}/tmux/tmux.conf"
      bind | split-window -h
      bind - split-window -v

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind [ switch-client -p
      bind ] switch-client -n

      bind -r C-h select-window -t :-
      bind -r C-l select-window -t :+

      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      set-option -sa terminal-features ',alacritty:RGB'
    '';
  };
}

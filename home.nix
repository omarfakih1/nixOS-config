{ config, pkgs, ... }:
{
# Home Manager needs a bit of information about you and the paths it should
# manage.
  home.username = "omarf";
  home.homeDirectory = "/home/omarf";
# This value determines the Home Manager release that your configuration is
# compatible with. This helps avoid breakage when a new Home Manager release
# introduces backwards incompatible changes.
#
# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.
# The home.packages option allows you to install Nix packages into your
# environment.
    home.packages = [
# # Adds the 'hello' command to your environment. It prints a friendly
# # "Hello, world!" when run.
# pkgs.hello
# # It is sometimes useful to fine-tune packages, for example, by applying
# # overrides. You can do that directly here, just don't forget the
# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
# # fonts?
# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
# # You can also create simple shell scripts directly inside your
# # configuration. For example, this adds a command 'my-hello' to your
# # environment:
# (pkgs.writeShellScriptBin "my-hello" ''
#   echo "Hello, ${config.home.username}!"
# '')
    ];
# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
  home.file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;
# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
  };

# Home Manager can also manage your environment variables through
# 'home.sessionVariables'. These will be explicitly sourced when using a
# shell provided by Home Manager. If you don't want to manage your shell
# through Home Manager then you have to manually source 'hm-session-vars.sh'
# located at either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/omarf/etc/profile.d/hm-session-vars.sh
#
  home.sessionVariables = {
# EDITOR = "emacs";
  };

# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

# Zsh with Oh My Zsh
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "";
      plugins = [
        "git"
      ];
    };
  };

#Kitty
  programs.kitty = {
    enable = true;

    settings = {
# Appearance
      background_opacity = "0.85";
      dynamic_background_opacity = true;
      blur_background = true;
      window_margin_width = 0;
      window_border_width = "0.5pt";
      draw_minimal_borders = true;
      inactive_text_alpha = "0.7";
      active_border_color = "none";
      hide_window_decorations = false;

# Cursor
      cursor_shape = "beam";
      cursor_blink_interval = 0;

# Scrollback
      scrollback_lines = 2000;

# Window resize
      window_resize_step_cells = 2;
      window_resize_step_lines = 2;
      initial_window_width = 640;
      initial_window_height = 400;

# Tabs
      tab_bar_style = "powerline";

# Layouts
      enabled_layouts = "splits";

# Bell
      enable_audio_bell = false;

# macOS (harmless on Linux)
      macos_titlebar_color = "background";
      macos_thicken_font = "0.75";

# Colors — Dark One Nuanced
      background = "#282c34";
      foreground = "#abb2bf";

      color0  = "#3f4451";
      color1  = "#e06c75";
      color2  = "#98c379";
      color3  = "#d19a66";
      color4  = "#61afef";
      color5  = "#c678dd";
      color6  = "#56b6c2";
      color7  = "#e6e6e6";

      color8  = "#4f5666";
      color9  = "#ff7b86";
      color10 = "#b1e18b";
      color11 = "#efb074";
      color12 = "#67cdff";
      color13 = "#e48bff";
      color14 = "#63d4e0";
      color15 = "#ffffff";

      color16 = "#282c34";
      color17 = "#c25d66";
      color18 = "#82a566";
      color19 = "#b38257";
      color20 = "#5499d1";
      color21 = "#a966bd";
      color22 = "#44919a";
      color23 = "#c8c8c8";
    };

  };


# Zoxide (modern z alternative)
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}

{ config, pkgs, unstablePkgs, ... } @ inputs:

{
  environment.systemPackages = with pkgs; [
#Coding
    ghostty
      vim
      git
      gh
      inputs.zed.packages."${system}".default # beta
      fastfetch
      neofetch
      neovim
      gcc
      fzf
      ripgrep
      fd
      rustup

#Browsers		
      inputs.helium.packages.${system}.default
      inputs.zen-browser.packages."${system}".default


#jst stuff yk
      ani-cli

#System
      home-manager
      hyprpaper
      inputs.vicinae.packages.${system}.default
      kdePackages.dolphin
      openrgb
      grimblast
      libnotify
      wget
      hyprshot
      gnused      # sed
      curl
      mpv
      unzip
      aria2       # aria2c
      yt-dlp
      ffmpeg
      fzf
      patch

#System UI/Plugins
    kitty
    inputs.snappy-switcher.packages.${pkgs.system}.default
    waybar
    swaynotificationcenter
    wlogout
    kdePackages.breeze-icons
    waypaper
    swww
    mpvpaper
    ];
}

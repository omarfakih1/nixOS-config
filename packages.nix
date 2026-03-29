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

    #System
		home-manager
		hyprpaper
		inputs.vicinae.packages.${system}.default
		kdePackages.dolphin
    openrgb
    grimblast
    libnotify
    wget

		#System UI/Plugins
		kitty # required for the default Hyprland config
    waybar
    wlogout

	];
}

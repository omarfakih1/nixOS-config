{ config, pkgs, unstablePkgs, ... } @ inputs:

{
environment.systemPackages = with pkgs; [
		
		#Coding
		ghostty
		vim
		git
		gh
		inputs.zed.packages."${system}".default # beta
		
		#Browsers		
		inputs.zen-browser.packages."${system}".default # beta
		inputs.helium.packages.${system}.default

		#System
		pkgs.home-manager
		
		#System UI/Plugins
		pkgs.kitty # required for the default Hyprland config

	];
}

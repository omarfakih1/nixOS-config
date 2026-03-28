{
  description = "my nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zed.url = "github:zed-industries/zed";
    helium.url = "github:schembriaiden/helium-browser-nix-flake";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, zen-browser, zed, helium, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    unstablePkgs = import nixpkgs-unstable { inherit system; };
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit zen-browser;
	  inherit zed;
	  inherit helium;
          unstablePkgs = unstablePkgs;
        };
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          ./packages.nix
        ];
      };
    };

    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [ git neovim zsh ];
      shellHook = ''
        echo "Welcome to your dev shell"
      '';
    };
  };
}

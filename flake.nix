{
  description = "my nixos config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    zed.url = "github:zed-industries/zed";
    helium.url = "github:schembriaiden/helium-browser-nix-flake";
    zen-browser.url = "github:youwen5/zen-browser-flake";
    snappy-switcher.url = "github:OpalAayan/snappy-switcher";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vicinae.url = "github:vicinaehq/vicinae";
  };

    outputs = { self, nixpkgs, nixpkgs-unstable, zed, helium, zen-browser, home-manager, vicinae, snappy-switcher, ... }:
      let
      system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    unstablePkgs = import nixpkgs-unstable { inherit system; };
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit snappy-switcher;
            inherit zed;
            inherit helium;
            inherit vicinae;
            inherit zen-browser;
            unstablePkgs = unstablePkgs;
          };
          modules = [
            ./configuration.nix
              ./hardware-configuration.nix
              ./packages.nix
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.omarf = import ./home.nix;
              }
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

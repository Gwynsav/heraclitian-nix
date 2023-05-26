{ config, pkgs, lib, impermanence, home-manager, ... }:

let
  colors = import ../../shared/themes/tokyonight { };
  fonts  = import ../../shared/fonts.nix { inherit config; };
in

{
  imports = [
    home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    users.gw = { pkgs, ... }: {
      imports = [
        ( import ../../shared/home.nix { inherit config pkgs lib colors fonts impermanence; } )
        ( import ./home.nix            { inherit config pkgs lib colors fonts; } )
      ];
    };
  };
}

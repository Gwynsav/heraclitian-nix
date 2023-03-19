{ config, pkgs, impermanence, home-manager, ... }:

{
  imports = [
    home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    users.gw = { pkgs, ... }: {
      imports = [
        ( import ../../shared/home.nix { inherit config pkgs impermanence; } )
        ( import ./home.nix            { inherit config pkgs; } )
      ];
    };
  };
}

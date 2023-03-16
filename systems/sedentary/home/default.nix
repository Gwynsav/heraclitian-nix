{ config, pkgs, impermanence, home-manager, ... }:

{
  # Import Home Manager
  imports = [ 
    home-manager.nixosModules.home-manager
  ];

  home-manager.users.gw = { pkgs, ... }: {
    imports = [ 
      ( import ../../shared/home.nix { inherit config pkgs impermanence; } )
    ];
  };
}

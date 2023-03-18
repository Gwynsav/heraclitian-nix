{ config, nixpkgs, inputs, overlays, 
  system, impermanence, home-manager, ... }:

home-manager.lib.homeManagerConfiguration {

  modules = [
    # Shared home configuration
    ../shared/home.nix
    
    # User specific home configuration
    ./home.nix
  ];

  pkgs = import inputs.nixpkgs {
    system = "${system}";
    config.allowUnfree = true;
    inherit overlays;
  };
  extraSpecialArgs = { inherit inputs system impermanence; };
}

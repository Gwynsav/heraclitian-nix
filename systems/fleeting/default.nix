{ config, nixpkgs, overlays, inputs, impermanence, home-manager }: 

nixpkgs.lib.nixosSystem {
  specialArgs = { inherit inputs impermanence home-manager; };
  modules = [
    { 
      nixpkgs = { 
        overlays           = overlays; 
        config.allowUnfree = true; 
      }; 
    }
    ./configuration.nix
  ];
}

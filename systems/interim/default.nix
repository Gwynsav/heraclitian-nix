{ config, nixpkgs, overlays, inputs, impermanence, home-manager, nur }: 

nixpkgs.lib.nixosSystem {
  specialArgs = { inherit inputs impermanence home-manager; };
  modules = [
    { 
      nixpkgs = { 
        overlays           = overlays; 
        config.allowUnfree = true; 
      }; 
    }
    nur.nixosModules.nur
    ./configuration.nix
  ];
}

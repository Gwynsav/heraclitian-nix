{ config, nixpkgs, overlays, inputs, impermanence, home-manager }: 

with nixpkgs; lib.nixosSystem {
  specialArgs = { inherit inputs impermanence home-manager; };
  modules = [
    { nixpkgs = { inherit config overlays; }; }
    ./configuration.nix
  ];
}

{ config, nixpkgs, overlays, inputs }: 

with nixpkgs; lib.nixosSystem {
  modules = [
    { nixpkgs = { inherit config overlays; }; }
    ./configuration.nix
  ];
}

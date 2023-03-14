{ config, nixpkgs, overlays, inputs }: with nixpkgs;

lib.nixosSystem rec {
  modules = [
    { nixpkgs = { inherit config overlays; }; }
    ./configuration.nix
  ];
}

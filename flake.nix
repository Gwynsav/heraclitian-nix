{
  description = "Basic input pinning, host configuration flake";
  
  inputs = {
    master.url   = "github:nixos/nixpkgs/master";
    stable.url   = "github:nixos/nixpkgs/nixos-22.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    nixpkgs.follows = "stable";
  };
  
  outputs = { self, nixpkgs, ... } @inputs:
    with nixpkgs.lib; let

      config = {
        allowUnfree = true;
        allowBroken = true;
      };
      system = "x86_64-linux";

      overlays = with inputs; [
        (final: _:
          let inherit (final) system;
          in {
            master   = import master   { inherit config system; };
            stable   = import stable   { inherit config system; };
            unstable = import unstable { inherit config system; };
          }
        )
      ];

    in {
      nixosConfigurations = {
        sedentary = 
          import ./systems/sedentary
          { inherit config nixpkgs overlays inputs; };
      };
      sedentary = self.nixosConfigurations.sedentary.config.system.build.toplevel;
    };
}

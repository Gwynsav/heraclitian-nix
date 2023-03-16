{
  description = "Basic input pinning, host configuration flake";
  
  inputs = {
    master.url   = "github:nixos/nixpkgs/master";
    stable.url   = "github:nixos/nixpkgs/nixos-22.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    nixpkgs.follows = "stable";
   
    impermanence.url = "github:nix-community/impermanence";
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs-f2k.url  = "github:fortuneteller2k/nixpkgs-f2k";
  };
  
  outputs = { self, nixpkgs, impermanence, home-manager, ... } @inputs:
    with nixpkgs.lib; let

      config = {
        allowUnfree = true;
        allowBroken = true;
      };
      system = "x86_64-linux";

      overlays = with inputs; [
        (final: _:
          let inherit (final) system;
          in (with nixpkgs-f2k.packages.${system}; {
            awesome = awesome-git;
            picom   = picom-dccsillag;
          }) // {
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
          { inherit config nixpkgs overlays inputs impermanence home-manager; };
      };
      sedentary = self.nixosConfigurations.sedentary.config.system.build.toplevel;
    };
}

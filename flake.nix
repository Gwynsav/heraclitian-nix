{
  description = "Basic input pinning, host configuration flake";
  
  inputs = {
    stable.url   = "github:nixos/nixpkgs/nixos-22.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    nixpkgs.follows = "stable";
   
    impermanence.url = "github:nix-community/impermanence";
    home-manager.url = "github:nix-community/home-manager";
    nur.url          = "github:nix-community/NUR";
    nixpkgs-f2k.url  = "github:fortuneteller2k/nixpkgs-f2k";
  };
  
  outputs = { self, nixpkgs, impermanence, home-manager, nur, ... } @inputs:
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
            stable   = import stable   { inherit config system; };
            unstable = import unstable { inherit config system; };
          }
        )
      ];

    in {
      nixosConfigurations = {
        interim = 
          import ./systems/interim
          { inherit config nixpkgs overlays inputs impermanence home-manager nur; };
      };
      interim = self.nixosConfigurations.interim.config.system.build.toplevel;
    };
}

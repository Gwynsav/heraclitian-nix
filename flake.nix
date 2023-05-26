{
  description = "Basic input pinning, host configuration flake";
  
  inputs = {
    stable.url   = "github:nixos/nixpkgs/nixos-22.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    nixpkgs.follows = "unstable";
   
    impermanence.url = "github:nix-community/impermanence";
    home-manager.url = "github:nix-community/home-manager";
    nur.url          = "github:nix-community/NUR";
    nixpkgs-f2k.url  = "github:fortuneteller2k/nixpkgs-f2k";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nur.inputs.nixpkgs.follows          = "nixpkgs";
    nixpkgs-f2k.inputs.nixpkgs.follows  = "nixpkgs";
  };
  
  outputs = { self, nixpkgs, impermanence, home-manager, nur, ... } @inputs:
    with nixpkgs.lib; let

      config = {
        allowUnfree = true;
        allowBroken = true;
      };
      system = "x86_64-linux";

      # Read all `.nix` files from a given directory.
      filterNixFiles = k: v: v == "regular" && hasSuffix ".nix" k;
      importNixFiles = path:
        (lists.forEach (mapAttrsToList (name: _: path + ("/" + name))
          (filterAttrs filterNixFiles (builtins.readDir path)))) import;

      overlays = with inputs; [
        (final: _:
          let inherit (final) system;
          in (with nixpkgs-f2k.packages.${system}; {
            awesome = awesome-git;
            picom   = picom-ft-labs;
          }) // {
            stable   = import stable   { inherit config system; };
            unstable = import unstable { inherit config system; };
          }
        )
      ] ++ (importNixFiles ./overlays);

    in {
      nixosConfigurations = {
        interim = 
          import ./systems/interim
          { inherit config nixpkgs overlays inputs impermanence home-manager nur; };
      };
      interim = self.nixosConfigurations.interim.config.system.build.toplevel;
    };
}

{ pkgs, colors, fonts, ... }:

{
  home = {
    packages = [ pkgs.unstable.tym ];
    file.".config/tym/config.lua".text = 
      import ./config.nix { inherit colors fonts; };
  };
}

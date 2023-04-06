{ pkgs, lib, colors }:

{
  home = {
    packages = lib.attrValues {
      inherit (pkgs)
        hsetroot;
    };
    file.".xmonad/xmonad.hs".text =
      import ./hs.nix { inherit colors; };
  };
}

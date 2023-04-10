{ pkgs, lib, colors }:

{
  home = {
    packages = lib.attrValues {
      inherit (pkgs)
        hsetroot;
    };
    file = {
      ".config/xmonad/xmonad.hs".source       = ./xmonad.hs;
      ".config/xmonad/lib/MyBinds.hs".source  = ./modules/MyBinds.hs;
      ".config/xmonad/lib/MyLayout.hs".source = ./modules/MyLayout.hs;
      ".config/xmonad/lib/MyManage.hs".source = ./modules/MyManage.hs;
      ".config/xmonad/lib/MyColor.hs".text    =
        import ./modules/MyColor.nix { inherit colors; };
    };
  };
}

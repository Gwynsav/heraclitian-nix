# ---------------------- #
# -- Lua shell!11!!!1 -- #
# ---------------------- #
{ pkgs, config }:

{
  home = {
    packages = [ pkgs.unstable.hilbish ];
    file = {
      ".config/hilbish/init.lua" = {
        text = import ./config.nix { inherit config; }; 
      };
    };
  };
}

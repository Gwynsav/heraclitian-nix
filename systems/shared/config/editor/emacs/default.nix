{ pkgs, fonts }:

{
  programs.emacs = {
    enable  = true;
    package = pkgs.unstable.emacs;
  };
  home.file = {
    ".config/emacs/init.el".text = import ./init.nix { inherit fonts; };
  };
}

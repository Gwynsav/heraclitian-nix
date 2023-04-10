{ config, colors, fonts }:

{
  programs.rofi = {
    enable      = true;
    font        = "${fonts.sans} 10";
    extraConfig = {
      modi                = "drun";
      display-drun        = "";
      drun-display-format = "{name}";
      sidebar-mode        = false;
    };
    theme       = import ./theme.nix { inherit config colors; };
  };
}

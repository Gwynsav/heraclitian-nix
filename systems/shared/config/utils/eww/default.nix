{ pkgs, colors, fonts }:

{
  home = {
    packages = [ 
      pkgs.unstable.eww 
      pkgs.wmctrl
    ];
    file = {
      # Because I cannot put an scss file generated through nix in
      # `XDG_CONFIG_DIR/eww` if I use `configDir`, I need to do the
      # whole thing manually. To top it off, the eww HM module REQUIRES
      # you to set a symlink for that directory, so I can't even use that.

      # Yuck files.
      ".config/eww/eww.yuck".source = 
        ./setup/eww.yuck;
      ".config/eww/horizontal/bar/bar.yuck".source = 
        ./setup/horizontal/bar/bar.yuck;

      # SCSS files.
      ".config/eww/eww.scss".text =
        import ./baseCSS.nix { inherit colors fonts; };
      ".config/eww/horizontal/bar/bar.scss".source =
        ./setup/horizontal/bar/bar.scss;

      # Scripts
      ".local/bin/volume" = {
        source     = ./scripts/volume;
        executable = true;
      };
      ".local/bin/network" = {
        source     = ./scripts/network;
        executable = true;
      };
      ".local/bin/bluetooth" = {
        source     = ./scripts/bluetooth;
        executable = true;
      };
      ".local/bin/workspace" = {
        source     = ./scripts/workspace;
        executable = true;
      };
    };
  };
}

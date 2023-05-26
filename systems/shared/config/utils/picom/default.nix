{ colors }:

{
  services.picom = {
    enable    = true;
    backend   = "glx";
    # The "experimental-backends" flag has been deprecated.
    # See https://github.com/yshui/picom/pull/875.
    # extraArgs = [ "--experimental-backends" ];

    shadow    = true;
    shadowExclude = [ 
      "class_g *?= 'slop'"
      "name = 'hacksaw'"
      "_GTK_FRAME_EXTENTS@:c"
    ];

    fade      = true;
    fadeDelta = 4;
    fadeSteps = [ 0.03 0.03 ];

    settings  = {
      # Optimization.
      glx-no-stencil       = true;
      glx-no-rebind-pixmap = true;
      xrender-sync-fence   = true;
      use-damage           = true;
      blur_background      = false;
      vSync                = true;

      # Fancy shadows
      shadow-radius        = 20;
      shadow-color         = "#${colors.dbg}";

      # FT-Labs Picom fork animations. Unlike dccsillag's and
      # Pijulius', it actually works properly on my system.
      animations                 = true;
      # Open and close animations.
      animation-for-open-window  = "zoom";
      animation-for-unmap-window = "squeeze";
      # Popup animations.
      animation-for-trasient-window = "slide-down";
    };

    wintypes  = {
      normal       = { full-shadow = true; };
      notification = { full-shadow = true; };
      tooltip      = { full-shadow = false; fade = false; focus = true; };
      dock         = { full-shadow = true; clip-shadow-above = true; };
      dnd          = { shadow = false; };
    };
  }; 
}

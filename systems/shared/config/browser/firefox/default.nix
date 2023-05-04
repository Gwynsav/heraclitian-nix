{ config, colors, fonts }:

{
  programs.firefox = {
    enable      = true;
    profiles.gw = {
      id          = 0;
      extensions  = with config.nur.repos.rycee.firefox-addons; [
        bitwarden cookie-autodelete ublock-origin
      ];
      userChrome  = import ./userChrome.nix { inherit colors fonts; };
      extraConfig = import ./userPref.nix   { };
    };
  };
  home.sessionVariables = {
    BROWSER = "firefox";
  };
}

{ pkgs, impermanence, home-manager }:

{
  # Import Home Manager
  imports = [ 
    home-manager.nixosModules.home-manager
  ];

  home-manager.users.gw = { pkgs, ... }: {
    imports = [ 
      impermanence.nixosModules.home-manager.impermanence
    ];

    programs.home-manager.enable = true;
    home = {
      persistence."/nix/persist/home/gw" = {
        directories = [ 
          "Desktop" "Downloads" "Music" "Pictures"
          ".local/share/keyrings" ".local/share/direnv"
          {
            directory = ".local/share/Steam";
            method    = "symlink";
          }
        ];
        files = [
          ".screenrc"
          ".gitconfig"
        ];
        allowOther = true;
      };
      stateVersion = "22.11";
    };
  };
}

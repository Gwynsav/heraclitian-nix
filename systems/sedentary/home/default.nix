{ pkgs }:

let
  home-manager = builtins.fetchTarball {
    url    = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
    sha256 = "0cypvlcqc047g757kw29bkdb212ncr28cp8wrsiylywvv82pis4g";
  };

  impermanence = builtins.fetchTarball {
    url    = "https://github.com/nix-community/impermanence/archive/master.tar.gz";
    sha256 = "0hpp8y80q688mvnq8bhvksgjb6drkss5ir4chcyyww34yax77z0l";
  };
in 

{
  # Import Home Manager
  imports = [ "${home-manager}/nixos" ];

  home-manager.users.gw = { pkgs, ... }: {
    programs.home-manager.enable = true;

    imports = [ 
      "${impermanence}/home-manager.nix"
    ];

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
        allowOther = false;
      };

      stateVersion = "22.11";
    };
  };
}

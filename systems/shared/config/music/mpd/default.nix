{ pkgs, config }:

{
  services.mpd = {
    enable            = true;
    musicDirectory    = "${config.home-manager.users.gw.home.homeDirectory}/Music";
    dataDir           = "${config.home-manager.users.gw.home.homeDirectory}/.local/share/mpd";
    extraConfig       = ''
      auto_update          "yes"
      auto_update_depth    "3"
      restore_paused       "yes"
      volume_normalization "yes"
      mixer_type           "software"
      audio_output {
        type               "pipewire"
        name               "PipeWire Sound Server"
        buffer_time        "100000"
      }
      audio_output {
        type               "fifo"
        name               "Visualizer"
        path               "/tmp/mpd.fifo"
        format             "44100:16:2"
      }
      connection_timeout   "15"
      max_connections      "8"
      max_playlist_length  "1024"
      '';
    network.startWhenNeeded = true;
  };
  
  # Include compatibility settings for mpd.
  home.packages              = [ pkgs.stable.playerctl ];
  services.mpdris2.enable    = true;
  services.playerctld.enable = true;
}

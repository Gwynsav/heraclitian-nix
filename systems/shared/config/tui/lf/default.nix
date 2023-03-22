_:
{
  programs.lf = {
    enable    = true;
    settings  = {
      shell      = "bash";
      shellopts  = "-eu";
      hidden     = true;
      wrapscroll = true;
      info       = "size:time";
    };
    commands = {
      extract   = "\${{
            set -f
            case $f in
                *.tar.bz|*.tar.bz2|*.tbz|*.tbz2) tar xjvf $f;;
                *.tar.gz|*.tgz) tar xzvf $f;;
                *.tar.xz|*.txz) tar xJvf $f;;
                *.zip) unzip $f;;
                *.rar) unrar x $f;;
                *.7z) 7z x $f;;
            esac
        }}
      ";
      yank-path = "$printf '%s' \"$fx\" | xclip -i -selection clipboard";
    };
    keybindings = {
      S = "shell";
      D = "delete";
      a = "push %mkdir<space>";
      Y = "yank-path";
    };
  };
}

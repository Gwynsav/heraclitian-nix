{ config }:
''
  -- Imports
  ----------
  local lunacolors = require('lunacolors')
  local bait       = require('bait')
  local promptua   = require('promptua')

  -- Prompt
  ---------
  promptua.setConfig {
    prompt = {
      icon    = "→",
      success = "",
      fail    = ""
    }
  }

  promptua.setTheme {
    -- Dir and Git repo.
    {
      provider  = "dir.path",
      style     = "grayBg white",
      separator = "",
      format    = "@style @icon@info "
    },
    { provider = "git.branch",  style = "yellow",   separator = "", icon = "  " },
    { provider = "git.dirty",   style = "bold red", separator = "", icon = " [!] " },
    { separator = "\n" },
    -- Actual prompt thing.
    {
      provider  = "prompt.icon",
      style     = "blue",
      separator = " "
    }
  }
  promptua.init()

  -- Aliases
  ----------
  hilbish.alias("sudo", "doas")
  hilbish.alias("ls",   "exa -l")
  hilbish.alias("nix-test", 
                "sudo nixos-rebuild test --flake '/etc/nixos?submodules=1#${config.networking.hostName}' --fast")
  hilbish.alias("nix-switch", 
                "sudo nixos-rebuild switch --flake '/etc/nixos?submodules=1#${config.networking.hostName}'")

  -- Misc
  -------
  hilbish.opts.greeting = false
  hilbish.opts.motd     = false
  hilbish.runnerMode("hybridRev")
  hilbish.prependPath("~/.local/bin/")
''

# ---------------------------------- #
# -- Lua terminal but not bloated -- #
# ---------------------------------- #

{ ... }:
''
  local tym = require('tym')
  tym.set_config({
    -- Basics
    ---------
    shell        = "hilbish",
    font         = "IBM Plex Mono 10",

    -- Cursor
    ---------
    cursor_shape      = "underline",
    cursor_blink_mode = "on",
    autohide          = true,

    -- Bling
    --------
    padding_horizontal = 32,
    padding_vertical   = 32,
  })
''

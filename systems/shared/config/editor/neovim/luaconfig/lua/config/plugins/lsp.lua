---------------------------------
-- LSPKind + CMP Configuration --
---------------------------------

require('lspkind').init({
    -- Defines how annotations are shown.
    -- Options: 'text', 'text_symbol', 'symbol_text', 'symbol'.
    mode = 'symbol_text',

    -- Default symbol map.
    -- Can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font).
    preset = 'codicons',

    -- Override preset symbols.
    symbol_map = {
      Text 			  = "",
      Method 		  = "",
      Function 	  = "",
      Constructor   = "",
      Field 		  = "ﰠ",
      Variable 	  = "",
      Class 		  = "ﴯ",
      Interface 	  = "",
      Module 		  = "",
      Property 	  = "ﰠ",
      Unit 			  = "塞",
      Value 		  = "",
      Enum 			  = "",
      Keyword 		  = "",
      Snippet 		  = "",
      Color 		  = "",
      File 			  = "",
      Reference 	  = "",
      Folder 		  = "",
      EnumMember 	  = "",
      Constant 	  = "",
      Struct 		  = "פּ",
      Event 		  = "",
      Operator 	  = "",
      TypeParameter = ""
    }
})

require('cmp').setup {
	formatting = {
	  format = function(entry, vim_item)
		 -- Fancy icons and a name of kind.
		 vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

		 -- Set a name for each source.
		 vim_item.menu = ({
			buffer    = "「Buffer」",
			text      = "「Text」",
			nvim_lsp  = "「Lsp」",
			ultisnips = "「UltiSnips」",
			nvim_lua  = "「Lua」"
		 })[entry.source.name]

		 return vim_item
	  end
	}
}

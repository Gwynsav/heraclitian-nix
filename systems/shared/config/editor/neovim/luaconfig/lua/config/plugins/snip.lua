----------------------------
-- Snippets Configuration --
----------------------------

local g = vim.g

-- Snippet tab into regions.
g.UltiSnipsJumpForwardTrigger  = '<Tab>'
g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'
-- Edit snippets file in vertical window.
g.UltiSnipsEditSplit           = 'vertical'
g.UltiSnipsSnippetDirectories = {
	"snips"
}

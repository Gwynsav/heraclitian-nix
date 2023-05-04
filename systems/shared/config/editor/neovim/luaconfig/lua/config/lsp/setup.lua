----------------------
-- LSP Setup Script --
----------------------

local fn = vim.fn

-- on_attach config
-------------------
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap = true, silent = true }
	buf_set_keymap('n', 'gD',        '<Cmd>lua vim.lsp.buf.declaration()<CR>',                                opts)
	buf_set_keymap('n', 'gd',        '<Cmd>lua vim.lsp.buf.definition()<CR>',                                 opts)
	buf_set_keymap('n', 'K',         '<Cmd>lua vim.lsp.buf.hover()<CR>',                                      opts)
	buf_set_keymap('n', 'gi',        '<cmd>lua vim.lsp.buf.implementation()<CR>',                             opts)
	buf_set_keymap('n', '<C-k>',     '<cmd>lua vim.lsp.buf.signature_help()<CR>',                             opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',                       opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',                    opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D',  '<cmd>lua vim.lsp.buf.type_definition()<CR>',                            opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',                                     opts)
	buf_set_keymap('n', 'gr',        '<cmd>lua vim.lsp.buf.references()<CR>',                                 opts)
	buf_set_keymap('n', '<space>e',  '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',               opts)
	buf_set_keymap('n', '[d',        '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',                           opts)
	buf_set_keymap('n', ']d',        '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',                           opts)
	buf_set_keymap('n', '<space>q',  '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',                         opts)

	-- Set some keybinds conditional on server capabilities.
	if client.resolved_capabilities.document_formatting then
		buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
	elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
	end

	-- Set autocommands conditional on server_capabilities.
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
         ]],
			false
		)
	end
end

-- Standard paths for LSP servers
---------------------------------
-- Check if lspservers directory exists in data stdpath and create one if not.
local lspserver_dir = fn.isdirectory(fn.stdpath('data') .. '/lspservers')
if lspserver_dir == 0 then
	fn.mkdir(fn.stdpath('data') .. '/lspservers')
end

-- LSP Servers
--------------
-- NOTE: The Lua LSP server can be found in its own file, `lua_lsp`.
local lspconfig = require('lspconfig')

-- Nix
lspconfig.rnix.setup({
   on_attach = on_attach,
   autostart = true
})

-- Haskell (the wall of text)
lspconfig.hls.setup({
  on_attach = on_attach,
  autostart = true,
  settings = {
    haskell = {
      -- Turn off everything because HLS appears prone to crashing at the moment
      checkParents = "CheckOnSave",
      checkProject = false,
      formattingProvider = "ormolu",
      maxCompletions =  40,
      plugin = {
        alternateNumberFormat = {
          globalOn = false,
        },
        callHierarchy = {
          globalOn = false,
        },
        class = {
          globalOn = false,
        },
        eval = {
          globalOn = false,
        },
        ['ghcide-code-actions-bindings'] = {
          globalOn = false,
        },
        ['ghcide-code-actions-fill-holes'] = {
          globalOn = false,
        },
        ['ghcide-code-actions-imports-exports'] = {
          globalOn = false,
        },
        ['ghcide-code-actions-type-signatures'] = {
          globalOn = false,
        },
        ['ghcide-completions'] = {
          config = {
            autoExtendOn = false,
            snippetsOn = false,
          },
          globalOn = false,
        },
        ['ghcide-hover-and-symbols'] = {
          hoverOn = false,
          symbolsOn = false,
        },
        ['ghcide-type-lenses'] = {
          config = {
            mode = "always"
          },
          globalOn = false,
        },
        haddockComments = {
          globalOn = false,
        },
        hlint = {
          codeActionsOn = false,
          config = {
            flags = {},
          },
          diagnosticsOn = false,
        },
        importLens = {
          codeActionsOn = false,
          codeLensOn = false,
        },
        moduleName = {
          globalOn = false,
        },
        pragmas = {
          codeActionsOn = false,
          completionOn = false,
        },
        qualifyImportedNames = {
          globalOn = false,
        },
        refineImports = {
          codeActionsOn = false,
          codeLensOn = false,
        },
        retrie = {
          globalOn = false,
        },
        splice = {
          globalOn = false,
        },
      },
    },
  },
})

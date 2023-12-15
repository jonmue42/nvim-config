return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local on_attach = function(client, bufnr)
			-- LSP keymappings
			-- go to definition (e.g. let myValue: i64)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=bufnr})
			-- go to declaration (e.g. myValue = 1)
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {buffer=bufnr})
			-- go to implementation 
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=bufnr})
			-- grep for all references using Telescope
			vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", {buffer=bufnr})
			-- find all references with lsp
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer=bufnr})
			-- show docstring for whats under cursor
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=bufnr}) 

			-- print to indicate that the LSP is attached
			print("LSP attached! YIPPIE")
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		--configure servers:
		--rust
		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		--fortran
		lspconfig["fortls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			    cmd = {
			        'fortls',
			        '--lowercase_intrinsics',
			        '--hover_signature',
			        '--hover_language=fortran',
				    },
		})

		--latex
		lspconfig["ltex"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		--python
		lspconfig["jedi_language_server"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
    		lspconfig["lua_ls"].setup({
      			capabilities = capabilities,
      			on_attach = on_attach,
      			settings = { -- custom settings for lua
        				Lua = {
          				-- make the language server recognize "vim" global
          					diagnostics = {
            					globals = { "vim" },
          					},
          				workspace = {
            				-- make language server aware of runtime files
            				library = {
              					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
              					[vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
	end,
}

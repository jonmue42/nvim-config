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
		
		local on_attach = function()
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
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		--latex
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		--python
		lspconfig["pyright"].setup({
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

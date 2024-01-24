return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
    		"hrsh7th/cmp-path", -- source for file system paths
    		"L3MON4D3/LuaSnip", -- snippet engine
    		"saadparwaiz1/cmp_luasnip", -- for autocompletion
	},
	config = function()

		local cmp = require("cmp")

    		local luasnip = require("luasnip")

		cmp.setup({
			-- Makes error not appear for some autocompletes
			 snippet = {
      				expand = function(args)
        			require'luasnip'.lsp_expand(args.body)
      				end
    			},
		-- new keymaps	
			mapping = cmp.mapping.preset.insert({ -- mappings for insert mode
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				['<CR>'] = cmp.mapping.confirm({select = false}),
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-n>"] = cmp.mapping(function()  -- func to jump to next luasnip insertnode
					luasnip.jump(1)
				end)
			  }),
			  
		-- sources for autocompletion
			sources = cmp.config.sources({
        			{ name = "nvim_lsp" },
        			{ name = "luasnip" }, -- snippets
        			{ name = "buffer" }, -- text within current buffer
        			{ name = "path" }, -- file system paths
			}),
		})
	end,
}

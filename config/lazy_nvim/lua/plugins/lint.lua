return {
    "mfussenegger/nvim-lint", --linter plugin for linters provided by mason
    lazy = true,
    event = { "BufReadPre", "BufNewFile" }, -- load when new file or buffer
    config = function()
	    local lint = require("lint")

	    lint.linters_by_ft = {
		    -- fortran = {"compiler"},
	    }

	    --Code to enable linting, when entering buffer, after writing to after and after leaving insert mode
	    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
	
	    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	      group = lint_augroup,
	      callback = function()
	        lint.try_lint()
	      end,
	    })
    end

}

return{
	"dense-analysis/ale", --Plugin for Linting from compiler
	lazy = true,
	event = {"BufEnter *.f90"}, --Only load plugin for .f90 files, as nvim-lspconfig works for the rest
}

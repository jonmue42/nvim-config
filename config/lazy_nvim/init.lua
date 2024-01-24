vim.wo.number = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{import = "plugins"}, {import = "plugins.lsp"}}, {root = vim.fn.stdpath("data") .. "/lazy", {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
}})

require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/lua/snippets/"}) -- This loads custom snippets written in lua
require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.config/nvim/lua/vscode-snippets/"}) -- This loads snippets from vscode plugins (right now only fortran for vs snippets)

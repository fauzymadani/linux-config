-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lspconfig").pyright.setup({})
require("lspconfig").templ.setup({})
require("lspconfig").ast_grep.setup({})
require("lspconfig").vtsls.setup({})
require("lspconfig").intelephense.setup({})
require("lspconfig").stimulus_ls.setup({})
require("lspconfig").csharp_ls.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").ast_grep.setup({
  filetypes = {
    "cpp",
    "rust",
    "go",
    "java",
    "python",
    "javascript",
    "typescript",
    "html",
    "css",
    "kotlin",
    "dart",
    "lua",
  },
})

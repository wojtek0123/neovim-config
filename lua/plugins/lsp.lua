return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        tsserver = {},
        angularls = {
          cmd = { "node", "/usr/lib/node_modules/@angular/language-server/index.js", "--stdio" },
          filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
          root_dir = require("lspconfig.util").root_pattern("angular.json", "tsconfig.json"),
        },
        html = {},
        cssls = {},
        nxls = {},
        lua_ls = {},
        tailwindcss = {},
        prismals = {},
      },
    },
  },
}

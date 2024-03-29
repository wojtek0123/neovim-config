return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        tsserver = {},
        angularls = {},
        html = {},
        cssls = {},
        nxls = {},
        lua_ls = {},
        tailwindcss = {},
      },
    },
  },
}

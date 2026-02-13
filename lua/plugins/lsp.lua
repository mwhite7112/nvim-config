return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = false,
        ty = true,
        ruff = true,
      },
    },
  },
}

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      float = {
        transparent = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "folke/noice.nvim",
    enabled = false,
  },
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        win = {
          position = "right",
        },
      },
      picker = {
        sources = {
          explorer = {
            auto_close = false,
            jump = { close = false },
          },
        },
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          local explorer_win = nil
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            local ft = vim.bo[buf].filetype
            if ft == "snacks_picker_list" then
              explorer_win = win
              break
            end
          end

          if not explorer_win then
            Snacks.explorer()
          else
            vim.api.nvim_set_current_win(explorer_win)
          end
        end,
        desc = "Open/Focus Explorer",
      },
      {
        "<leader>ec",
        function()
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            local ft = vim.bo[buf].filetype
            if ft == "snacks_picker_list" then
              vim.api.nvim_win_close(win, false)
              return
            end
          end
        end,
        desc = "Close Explorer",
      },
      {
        "<leader>fe",
        function()
          vim.ui.input({
            prompt = "Edit file: ",
            completion = "file",
          }, function(filepath)
            if filepath and filepath ~= "" then
              vim.cmd("e " .. filepath)
            end
          end)
        end,
        desc = "Edit/Create File",
      },
      {
        "Q",
        function()
          Snacks.bufdelete()
        end,
        desc = "Delete Buffer",
      },
    },
  },
}

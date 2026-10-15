return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      preview = {
        filetypes = {
          "markdown",
          "quarto",
          "rmd",
          "typst",
        },

        ignore_buftypes = {
          "nofile",
        },

        hybrid_modes = {
          "n",
          "i",
        },

        linewise_hybrid_mode = true,
      },
    },

    keys = {
      {
        "<leader>mp",
        "<cmd>Markview toggle<cr>",
        desc = "Preview Toggle",
      },
      {
        "<leader>ms",
        "<cmd>Markview splitToggle<cr>",
        desc = "Split Preview",
      },
      {
        "<leader>mo",
        "<cmd>Markview splitOpen<cr>",
        desc = "Split Open",
      },
      {
        "<leader>mc",
        "<cmd>Markview splitClose<cr>",
        desc = "Split Close",
      },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          "<leader>m",
          group = "[Markdown]",
        },
      },
    },
  },
}

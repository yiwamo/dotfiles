return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "-",
        function()
          require("oil").open()
        end,
        desc = "Open parent directory",
      },
    },
    opts = {},
  },
}

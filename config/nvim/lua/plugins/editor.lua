return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<C-l>"] = {
          function(cmp)
            cmp.show({ providers = { "lsp" } })
          end,
        },
      },
      completion = {
        menu = {
          border = "rounded",
          winhighlight = "Normal:NormalFloat,FloatBorder:FzfLuaBorder",
        },

        documentation = {
          window = {
            border = "rounded",
          },
        },
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    opts = {
      defaults = {
        formatter = "path.filename_first",
        no_header = true,
        no_header_i = true,
      },
      winopts = {
        backdrop = 100,
        width = 60,
        preview = { hidden = "hidden" },
      },
      grep = {
        winopts = {
          preview = { hidden = "nohidden" },
          width = 1,
        },
      },
    },
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
      { "<leader>e", ":Oil --float<CR>", desc = "Oil" },
    },
    opts = {
      keymaps = {
        ["<C-s>"] = "<CMD>w<CR>",
        ["<C-l>"] = "actions.select_vsplit",
        ["q"] = "actions.close",
      },
      view_options = {
        show_hidden = true,
      },
      float = {
        max_width = 60,
        max_height = 20,
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.icons" },
  },
}

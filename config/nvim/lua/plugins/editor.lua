return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    keys = {
      { "<leader>o/", "<cmd>ObsidianSearch<cr>", desc = "Grep in Second Brain" },
      { "<leader>onn", "<cmd>ObsidianNewFromTemplate<cr>", desc = "New note" },
      { "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "Search Notes" },
      { "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Search Tags" },
      { "<leader>ogd", "<cmd>ObsidianFollowLink<cr>", desc = "Follow Link" },
      { "<leader>ond", "<cmd>ObsidianToday<cr>", desc = "New daily note" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "Second Brain",
          path = "/Users/guilhermevictor/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain/",
        },
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "Daily",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%d-%m-%Y",
        -- Optional, default tags to add to each new daily note created.
        default_tags = {},
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = "daily.md",
      },
      -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 2,
      },
      mappings = {},
      -- Optional, for templates (see below).
      templates = {
        folder = "assets/Templates",
        date_format = "%d-%m-%Y",
        time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },
      picker = {
        -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
        name = "fzf-lua",
        -- Optional, configure key mappings for the picker. These are the defaults.
        -- Not all pickers support all mappings.
        note_mappings = {},
        tag_mappings = {},
      },
      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        return title or tostring(os.time())
      end,
      -- Optional, alternatively you can customize the frontmatter data.
      ---@return table
      note_frontmatter_func = function(note)
        return vim.tbl_extend("force", note.metadata, { tags = note.tags })
      end,
    },
  },
  {
    "ibhagwan/fzf-lua",
    -- keys = {
    --   { "<leader>cd", "<cmd>Cd<cr>", desc = "Change Directory" },
    -- },
    opts = {
      preview_opts = "hidden",
      defaults = {
        formatter = "path.filename_first",
        no_header = true,
        no_header_i = true,
      },
      grep = {
        winopts = {
          width = 100,
        },
      },
      winopts = {
        backdrop = 100,
        width = 60,
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
        show_hidden = false,
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

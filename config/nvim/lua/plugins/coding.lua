return {
  { 'echasnovski/mini.pairs', version = '*', opts = {} },
  {
    'echasnovski/mini.surround',
    version = '*',
    keys = {
      'gsa',
      'gsd',
      'gsr',
    },
    opts = {
      mappings = {
        add = 'gsa', -- Add surrounding in Normal and Visual modes
        delete = 'gsd', -- Delete surrounding
        replace = 'gsr', -- Replace surrounding
      },
    },
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {
        ui = { border = 'rounded', width = 0.5, height = 0.8 },
      } },
      {
        'williamboman/mason-lspconfig.nvim',
      },
    },
    opts = {
      servers = {
        lua_ls = {},
      },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          map('gd', require('telescope.builtin').lsp_definitions, 'Goto Definition')
          map('gr', require('telescope.builtin').lsp_references, 'Goto References')
          map('gI', require('telescope.builtin').lsp_implementations, 'Goto Implementation')
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type Definition')
          map('<leader>ss', require('telescope.builtin').lsp_document_symbols, 'Search Symbols')
          map('<leader>sS', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')
          map('<leader>gr', vim.lsp.buf.rename, 'Rename')
          map('<leader>ca', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })
          map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
        end,
      })

      local servers = opts.servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())

      local border = {
        { '╭', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '╮', 'FloatBorder' },
        { '│', 'FloatBorder' },
        { '╯', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '╰', 'FloatBorder' },
        { '│', 'FloatBorder' },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })

      require('mason-lspconfig').setup {
        ensure_installed = ensure_installed,
        automatic_installation = true,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.handlers = {
              ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
              ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
            }
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      notify_on_error = false,
      format_on_save = function()
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },
}

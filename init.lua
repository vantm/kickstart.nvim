-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 1000

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Control line the wrap setting
vim.opt.wrap = false

-- Replace spaces by tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

-- Vertical lines
vim.opt.colorcolumn = '80,120'

-- Plugins options
vim.g.disable_autoformat = true

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

-- Custom keymaps

-- Resize buffers
vim.keymap.set('n', '<C-Up>', ':resize -3<cr>', { desc = 'Horizontally resize' })
vim.keymap.set('n', '<C-Down>', ':resize +3<cr>', { desc = 'Horizontally resize' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -3<cr>', { desc = 'Verically resize' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +3<cr>', { desc = 'Verically resize' })

-- Save buffer
vim.keymap.set('n', '<leader>w', ':w<cr>', { desc = 'Save the current buffer' })

-- Close buffers
vim.keymap.set('n', '<leader>x', ':bd<cr>', { desc = 'Close the current buffer' })

-- Better paste
vim.keymap.set('n', '<leader>p', '"+p', { desc = "Paste the content in the registry '+' after the current cursor" })
vim.keymap.set('v', '<leader>p', '"+p', { desc = "Paste the content in the registry '+' after the current cursor" })
vim.keymap.set('n', '<leader>P', '"+P', { desc = "Paste the content in the registry '+' before the current cursor" })
vim.keymap.set('v', '<leader>P', '"+P', { desc = "Paste the content in the registry '+' before the current cursor" })
vim.keymap.set('n', '<leader>y', '"+y', { desc = "Yank into the registry '+'" })
vim.keymap.set('v', '<leader>y', '"+y', { desc = "Yank into the registry '+'" })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = "Yank the current line into the registry '+'" })
vim.keymap.set('v', '<leader>Y', '"+Y', { desc = "Yank the current line into the registry '+'" })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { desc = 'Decrease indentation' })
vim.keymap.set('v', '>', '>gv', { desc = 'Increase indentation' })

-- Better replace
vim.keymap.set('n', 'S', '"_diwP', { desc = 'Replace word under the cursor' })
vim.keymap.set('v', 'S', '"_dp', { desc = '' })

-- Auto center after finding/moving
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Better join lines
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('v', 'J', 'mzJ`z')

-- Move line
vim.keymap.set('n', '<A-k>', ':m-2<CR>==', { desc = 'Move the current line above' })
vim.keymap.set('n', '<A-j>', ':m+1<CR>==', { desc = 'Move the current line below' })
vim.keymap.set('v', '<A-k>', ":m'<-2<CR>gv=gv", { desc = 'Move the selected lines above' })
vim.keymap.set('v', '<A-j>', ":m'>+1<CR>gv=gv", { desc = 'Move the selected lines below' })
vim.keymap.set('i', '<A-k>', '<C-o>:m-2<CR><C-o>==', { desc = 'Move the current line above' })
vim.keymap.set('i', '<A-j>', '<C-o>:m+1<CR><C-o>==', { desc = 'Move the current line below' })

-- Select language syntax
vim.keymap.set('n', '<leader>ls', ':set syntax=', { desc = 'Choose a language syntax' })

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', version = '~1.0.0', opts = {} },
      { 'mason-org/mason-lspconfig.nvim', version = '~1.0.0' },
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',

      -- OmniSharp extended LSP handlers
      'Hoffs/omnisharp-extended-lsp.nvim',
    },
    config = function(x)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          print('Default LSP attached to buffer ' .. event.buf)

          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
          map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
          map('gD', vim.lsp.buf.type_definition, 'Type [D]efinition')
          map('<leader>lr', vim.lsp.buf.rename, '[L]anguage [R]ename')
          map('<leader>la', vim.lsp.buf.code_action, '[L]anguage [A]ction', { 'n', 'x' })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('omnisharp-extended-lsp-attach', { clear = true }),
        pattern = { '*.cs', '*.vb', '*.cshtml', '*.vbhtml', '*.razor' },
        callback = function(event)
          print('Omnisharp extended LSP attached to buffer ' .. event.buf)

          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Overwrite the default LSP mappings with the ones provided by omnisharp-extended
          map('gd', require('omnisharp_extended').lsp_definition, '[G]oto [D]efinition')
          map('gr', require('omnisharp_extended').lsp_references, '[G]oto [R]eferences')
          map('gI', require('omnisharp_extended').lsp_implementation, '[G]oto [I]mplementation')
          map('<leader>D', require('omnisharp_extended').lsp_type_definition, 'Type [D]efinition')
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
      }

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local servers = {
        -- clangd = {},
        gopls = {},

        pyright = {},

        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },

        jsonls = {},

        prettier = {},

        omnisharp = {
          cmd = { 'omnisharp' },

          handlers = {
            ['textDocument/definition'] = require('omnisharp_extended').definition_handler,
            ['textDocument/typeDefinition'] = require('omnisharp_extended').type_definition_handler,
            ['textDocument/references'] = require('omnisharp_extended').references_handler,
            ['textDocument/implementation'] = require('omnisharp_extended').implementation_handler,
          },

          settings = {
            FormattingOptions = {
              EnableEditorConfigSupport = true,
              OrganizeImports = nil,
            },
            MsBuild = {
              LoadProjectsOnDemand = nil,
            },
            RoslynExtensionsOptions = {
              EnableAnalyzersSupport = nil,
              EnableImportCompletion = nil,
              AnalyzeOpenDocumentsOnly = nil,
              EnableDecompilationSupport = true,
            },
            Sdk = {
              IncludePrereleases = true,
            },
          },
        },
      }

      if vim.loop.os_uname().sysname == 'Linux' then
        servers.tsserver = {}
      else
        servers.ts_ls = {}
      end

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
        automatic_installation = true,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
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
    keys = {
      {
        '<leader>lf',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[L]anguage [F]ormat',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },

        python = { 'autopep8', 'isort', 'black', stop_after_first = true },

        html = { 'prettier' },
        css = { 'prettier' },
        scss = { 'prettier' },
        sass = { 'prettier' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        jsx = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        tsx = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },

        haskell = { 'fourmolu' },
      },
    },
  },

  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
      },

      appearance = {
        nerd_font_variant = 'normal',
      },

      completion = {
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      snippets = { preset = 'luasnip' },

      fuzzy = { implementation = 'lua' },

      signature = { enabled = true },
    },
  },

  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        disable_italics = true,
        disable_background = true,
        transparent_mode = true,
        italic = {
          strings = false,
          emphasis = false,
          comments = true,
          operators = false,
          folds = false,
        },
      }

      vim.cmd.colorscheme 'gruvbox'

      vim.o.background = 'dark'
    end,
  },

  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }

      require('mini.surround').setup {
        -- I customized mappings
        mappings = {
          add = 'ys', -- Add surrounding in Normal and Visual modes
          delete = 'ds', -- Delete surrounding
          find = 'gs', -- Find surrounding (to the right)
          find_left = 'gS', -- Find surrounding (to the left)
          highlight = 'ghs', -- Highlight surrounding
          replace = 'cs', -- Replace surrounding
          update_n_lines = '', -- Udpate `n_lines`
        },
      }

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      require('mini.pick').setup()

      vim.keymap.set('n', '<leader>ff', ':Pick files<cr>', { desc = '[F]ind [f]iles' })
      vim.keymap.set('n', '<leader>fh', ':Pick help<cr>', { desc = '[F]ind [h]elp' })
      vim.keymap.set('n', '<leader>fg', ':Pick grep<cr>', { desc = '[F]ind [g]rep' })
      vim.keymap.set('n', '<leader><leader>', ':Pick buffers<cr>', { desc = '[F]ind [g]rep' })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'gitcommit',
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
    },
  },

  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns',

  { import = 'custom.plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

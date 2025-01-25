-- You can add your own plugins here or in other files in this directory!
-- I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local function setup_pwsh()
  vim.cmd [[
    if has('win32')
      let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
      let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';Remove-Alias -Force -ErrorAction SilentlyContinue tee;'
      let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
      let &shellpipe  = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
      set shellquote= shellxquote=
    endif
  ]]
end

setup_pwsh()

return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
      label = {
        style = 'inline',
      },
      highlight = { backdrop = false },
      modes = {
        char = {
          highlight = { backdrop = false },
        },
      },
    },
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'B',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
    },
  },
  { 'mbbill/undotree' },
  {
    'ThePrimeagen/harpoon',
    event = 'BufEnter',
    branch = 'master',
    --branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    init = function()
      require('harpoon').setup {
        menu = {
          width = vim.api.nvim_win_get_width(0) - 8,
        },
      }

      local function map(mode, l, r, opts)
        opts = opts or {}
        vim.keymap.set(mode, l, r, opts)
      end

      map('n', '<leader>he', function()
        require('harpoon.ui').toggle_quick_menu {}
      end, { desc = '[H]arpoon [E]ditor' })

      map('n', '<leader>a', function()
        require('harpoon.mark').add_file()
      end, { desc = '[A]dd to Harpoon' })

      for i = 1, 9 do
        map('n', '<leader>' .. i, function()
          require('harpoon.ui').nav_file(i)
        end, { desc = 'Harpoon: Navigate to [' .. i .. ']' })
      end

      map({ 'n', 'i' }, '<C-j>', function()
        require('harpoon.ui').nav_next()
      end, { desc = 'Next buffer stored within Harpoon list' })

      map({ 'n', 'i' }, '<C-k>', function()
        require('harpoon.ui').nav_prev()
      end, { desc = 'Previous buffer stored within Harpoon list' })
    end,
    -- init = function()
    --   local harpoon = require 'harpoon'
    --
    --   harpoon:setup()
    --
    --   local function map(mode, l, r, opts)
    --     opts = opts or {}
    --     vim.keymap.set(mode, l, r, opts)
    --   end
    --
    --   map('n', '<leader>he', function()
    --     harpoon.ui:toggle_quick_menu(harpoon:list(), {
    --       ui_width_ratio = 0.8,
    --     })
    --   end, { desc = '[H]arpoon [E]ditor' })
    --
    --   map('n', '<leader>a', function()
    --     harpoon:list():add()
    --   end, { desc = '[A]dd to Harpoon' })
    --
    --   for i = 1, 9 do
    --     map('n', '<leader>' .. i, function()
    --       harpoon:list():select(i)
    --     end, { desc = 'Harpoon: Navigate to [' .. i .. ']' })
    --   end
    --
    --   map({ 'n', 'i' }, '<C-j>', function()
    --     harpoon:list():next {
    --       ui_nav_wrap = true,
    --     }
    --   end, { desc = 'Next buffer stored within Harpoon list' })
    --
    --   map({ 'n', 'i' }, '<C-k>', function()
    --     harpoon:list():prev {
    --       ui_nav_wrap = true,
    --     }
    --   end, { desc = 'Previous buffer stored within Harpoon list' })
    -- end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    init = function()
      require('toggleterm').setup {
        open_mapping = [[<C-t>]],
      }

      local function map(mode, l, r, opts)
        opts = opts or {}
        vim.keymap.set(mode, l, r, opts)
      end

      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new {
        cmd = 'lazygit',
        hidden = true,
        direction = 'float',
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd 'startinsert!'
          vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        end,
        -- function to run on closing the terminal
        on_close = function()
          vim.cmd 'startinsert!'
        end,
      }

      map('n', '<leader>g', function()
        lazygit:toggle()
      end, { desc = 'Open Lazygit' })
    end,
  },
}

-- You can add your own plugins here or in other files in this directory!
-- I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- {
  --   'justinmk/vim-sneak',
  --   dependencies = {
  --     'tpope/vim-repeat',
  --   },
  -- },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
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
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    init = function()
      local harpoon = require 'harpoon.ui'

      local function map(mode, l, r, opts)
        opts = opts or {}
        vim.keymap.set(mode, l, r, opts)
      end

      map('n', '<leader>he', function()
        harpoon.toggle_quick_menu()
      end, { desc = '[H]arpoon [E]ditor' })

      map('n', '<leader>a', function()
        harpoon.add_file()
      end, { desc = '[A]dd to Harpoon' })

      for i = 1, 9 do
        map('n', '<leader>' .. i, function()
          harpoon.nav_file(1)
        end, { desc = 'Harpoon: Navigate to [' .. i .. ']' })
      end
    end,
  },
}

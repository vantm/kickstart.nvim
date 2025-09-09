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

local group = vim.api.nvim_create_augroup('http_file_autocommands', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'http' },
  callback = function(ev)
    vim.api.nvim_buf_set_keymap(0, 'n', 'gx', ':Rest run<cr>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'gr', ':Rest open<cr>', { noremap = true, silent = true })
  end,
  group = group,
})

return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
      label = { style = 'inline' },
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
  {
    'mbbill/undotree',
    init = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Open the Undotree' })
    end
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
  -- { 'github/copilot.vim' },
  {
    'rest-nvim/rest.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, 'http')
      end,
    },
  },
  { 'mfussenegger/nvim-jdtls' },
}

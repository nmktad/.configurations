return {
  'nvim-lua/plenary.nvim', -- lua functions that many plugins use

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Git and related plugins
  {
    'tpope/vim-rhubarb',
    dependencies = {
      {
        'tpope/vim-fugitive',
        config = function()
          -- vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

          -- local nmktad_fugitive = vim.api.nvim_create_augroup('nmktad_fugitive', {})
          --
          -- local autocmd = vim.api.nvim_create_autocmd
          --
          -- autocmd(
          --     "BufWinEnter",
          --     {
          --         group = nmktad_fugitive,
          --         pattern = "*",
          --         callback = function()
          --             if vim.fn.isdirectory(".git") then
          --                 vim.cmd("Gstatus")
          --             end
          --
          --             local bufnr = vim.api.nvim_get_current_buf()
          --             local opts = { buffer = bufnr, remap = false }
          --
          --             vim.keymap.set('n', '<leader>s', vim.cmd.Git, opts)
          --             vim.keymap.set('n', '<leader>p', vim.cmd.GitPush, opts)
          --
          --             vim.keymap.set('n', '<leader>t', ':Git push -u origin ', opts)
          --         end
          --     }
          -- )

          -- vim.keymap.set('n', '<leader>gu', '<cmd>diffget //2<CR>')
          -- vim.keymap.set('n', '<leader>gh', '<cmd>diffget //3<CR>')
        end,
      },
    },
  },

  { 'numToStr/Comment.nvim', opts = {} },

  { 'Bilal2453/luvit-meta', lazy = true },
}

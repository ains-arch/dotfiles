-- configures lualine for statusline
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    vim.cmd("colorscheme catppuccin-mocha")
    require('lualine').setup()
  end
}

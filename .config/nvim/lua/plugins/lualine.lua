-- configures lualine for statusline
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    vim.cmd("colorscheme nightfox")
    require('lualine').setup()
  end
}

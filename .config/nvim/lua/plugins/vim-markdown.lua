-- configures vim-markdown for good markdown formatting    
return {
  'preservim/vim-markdown',
  dependencies = { 'godlygeek/tabular' },
  branch = 'master',
  config = function()
    -- Disable folding in vim-markdown
    vim.g.vim_markdown_folding_disabled = 1
  end
}

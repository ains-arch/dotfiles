-- MY STUFF --

-- LaTeX kintting --
vim.api.nvim_create_user_command("Knit", function()
  vim.cmd("!./knit.sh")
end, {})

-- RStudio rip
-- Define key mappings for R files using R.nvim
vim.api.nvim_create_autocmd("FileType", {
    pattern = "r",  -- Apply only for R files
    callback = function()
        -- Remap ',' in normal mode to send line
        vim.api.nvim_buf_set_keymap(0, 'n', ',', '<Plug>RDSendLine', { noremap = false, silent = true })
        -- Remap ',' in visual mode to send selection
        vim.api.nvim_buf_set_keymap(0, 'v', ',', '<Plug>RDSendSelection', { noremap = false, silent = true })
        -- Remap ',e' in visual mode to send selection
        vim.api.nvim_buf_set_keymap(0, 'v', ',e', '<Plug>RESendSelection', { noremap = false, silent = true })
    end,
})

vim.api.nvim_set_keymap('n', ',', '\\l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', ',', '\\ss',  { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', ',e', '',  { noremap = true, silent = true })

-- Open terminal split below, resize it, and start in terminal insert mode
vim.api.nvim_set_keymap('n', 'bterm', ':belowright split | resize 10 | term<CR>i', { noremap = true, silent = true })

-- Map <Esc> to exit terminal-mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Use ALT+{h,j,k,l} to navigate windows from any mode
local opts = { noremap = true, silent = true }

-- Terminal mode mappings
vim.api.nvim_set_keymap('t', '<A-h>', '<C-\\><C-n><C-w>h', opts)
vim.api.nvim_set_keymap('t', '<A-j>', '<C-\\><C-n><C-w>j', opts)
vim.api.nvim_set_keymap('t', '<A-k>', '<C-\\><C-n><C-w>k', opts)
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-n><C-w>l', opts)

-- Insert mode mappings
vim.api.nvim_set_keymap('i', '<A-h>', '<C-\\><C-n><C-w>h', opts)
vim.api.nvim_set_keymap('i', '<A-j>', '<C-\\><C-n><C-w>j', opts)
vim.api.nvim_set_keymap('i', '<A-k>', '<C-\\><C-n><C-w>k', opts)
vim.api.nvim_set_keymap('i', '<A-l>', '<C-\\><C-n><C-w>l', opts)

-- Normal mode mappings
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', opts)

-- Text wrapping
-- vim.opt.textwidth = 100
-- vim.api.nvim_set_keymap('n', 'tw', 'ggVGgq', { noremap = true, silent = true })
vim.opt.linebreak = true -- From Scott, makes the softwrapping better

-- Mapping <C-'> to insert a docstring template
vim.cmd([[
  function! InsertDocstring()
      let l:indent = '    '
      let l:template = l:indent . '"""' . "\n"
      let l:template .= l:indent . "\n"
      let l:template .= l:indent . "\n"
      let l:template .= l:indent . 'Arguments:' . "\n"
      let l:template .= l:indent . "\n"
      let l:template .= l:indent . 'Returns:' . "\n"
      let l:template .= l:indent . '"""'
      call append(line('.'), split(l:template, "\n"))
      normal! j
      normal! ==
  endfunction
]])
vim.api.nvim_set_keymap('n', '"""', '<Esc>:call InsertDocstring()<CR>jA', { noremap = true, silent = true })

-- Disable arrow keys in normal, insert, and visual mode
vim.api.nvim_set_keymap('n', '<Up>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Up>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Down>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Left>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Up>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Down>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Left>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Right>', '<nop>', { noremap = true, silent = true })

-- Easy escape
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Function to insert print statement below the current line
vim.cmd([[
  function! InsertPrintStatement()
      let l:save_cursor = getpos('.')
      let l:variable_name = expand('<cword>')
      let l:print_statement = 'print(f"DEBUG: ' . l:variable_name . ': {' . l:variable_name . '}")'
      normal! $
      execute "normal! o" . l:print_statement
      call setpos('.', l:save_cursor)
      startinsert
  endfunction
]])
vim.api.nvim_set_keymap('n', 'PR', ':call InsertPrintStatement()<CR><esc>l', { noremap = true, silent = true })

-- Function to set file type-specific key mappings for commenting and uncommenting
local function set_comment_keymaps()
  local file_ext = vim.fn.expand('%:e')

  -- Define key mappings based on file type
  if file_ext == 'py' then
    -- Override 'cc' mapping for Python commenting
    vim.api.nvim_set_keymap('n', 'cc', ':normal m`^I# <CR>``ll', { noremap = true, silent = true })
    -- Override 'CC' mapping for Python uncommenting
    vim.api.nvim_set_keymap('n', 'CC', ':normal m`^xx<CR>``hh', { noremap = true, silent = true })
  elseif file_ext == 'vim' or file_ext == 'vimrc' then
    -- Override 'cc' mapping for Vimscript commenting
    vim.api.nvim_set_keymap('n', 'cc', ':normal m`^I" <CR>``ll', { noremap = true, silent = true })
    -- Override 'CC' mapping for Vimscript uncommenting
    vim.api.nvim_set_keymap('n', 'CC', ':normal m`^xx<CR>``hh', { noremap = true, silent = true })
  elseif file_ext == 'sh' then
    -- Override 'cc' mapping for Shell scripting commenting
    vim.api.nvim_set_keymap('n', 'cc', ':normal m`^I# <CR>``ll', { noremap = true, silent = true })
    -- Override 'CC' mapping for Shell scripting uncommenting
    vim.api.nvim_set_keymap('n', 'CC', ':normal m`^xx<CR>``hh', { noremap = true, silent = true })
  elseif file_ext == 'lua' then
    -- Override 'cc' mapping for Lua commenting
    vim.api.nvim_set_keymap('n', 'cc', ':normal m`^I-- <CR>``ll', { noremap = true, silent = true })
    -- Override 'CC' mapping for Lua uncommenting
    vim.api.nvim_set_keymap('n', 'CC', ':normal m`^xx<CR>``hh', { noremap = true, silent = true })
  elseif file_ext == 'tex' then
    -- Override 'cc' mapping for LaTeX commenting
    vim.api.nvim_set_keymap('n', 'cc', ':normal m`^I% <CR>``ll', { noremap = true, silent = true })
    -- Override 'CC' mapping for LaTeX uncommenting
    vim.api.nvim_set_keymap('n', 'CC', ':normal m`^xx<CR>``hh', { noremap = true, silent = true })
  elseif file_ext == 'yml' then
    -- Override 'cc' mapping for yaml commenting
    vim.api.nvim_set_keymap('n', 'cc', ':normal m`^I# <CR>``ll', { noremap = true, silent = true })
    -- Override 'CC' mapping for yaml uncommenting
    vim.api.nvim_set_keymap('n', 'CC', ':normal m`^xx<CR>``hh', { noremap = true, silent = true })
  end
end

-- Create an autocmd to call the function when opening a buffer
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  pattern = '*',
  callback = set_comment_keymaps
})

-- Mouse input is for the weak
vim.opt.mouse = ""

-- MIKE'S STUFF, COPIED FROM .VIMRC --

-- General options
vim.opt.number = true                   -- Show line numbers
vim.opt.spell = true                    -- Enable spell check
vim.opt.spelllang = 'en_us'             -- Set spell check language to English (US)
vim.cmd('filetype plugin indent on')    -- Enable filetype-specific plugins and indentation
vim.cmd('syntax enable')                -- Enable syntax highlighting
vim.g.mapleader = ','                   -- Set leader key to ","
vim.opt.hlsearch = true                 -- Highlight search results
vim.opt.incsearch = true                -- Incremental search
vim.opt.showcmd = true                  -- Show (partial) command in status line

-- Tab completion
vim.opt.wildmode = {'longest', 'list', 'full'} -- Command-line completion mode
vim.opt.wildmenu = true                        -- Enable command-line completion wild menu

-- Indentation settings
vim.opt.tabstop = 4             -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4          -- Number of spaces to use for autoindent
vim.opt.expandtab = true        -- Convert tabs to spaces
vim.opt.smartindent = true      -- Smart indentation
-- vim.cmd('set softtabstop=2') -- From Scott, number of spaces for a tab when editing

-- Key mappings for indentation
vim.api.nvim_set_keymap('n', '<S-Tab>', '<<', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', '<Esc><<i', { noremap = true, silent = true })

-- Remove annoying ex-mode feature
-- vim.api.nvim_set_keymap('n', 'Q', '<nop>', { noremap = true, silent = true })

-- Restore old state of file on reload
vim.cmd('au BufWinLeave * mkview')
-- vim.cmd('au BufWinEnter * silent loadview')

-- Syntax highlighting
vim.cmd('hi clear SpellBad')
vim.cmd('hi clear SpellLocal')
vim.cmd('hi clear SpellCap')
vim.cmd('hi clear SpellRare')
vim.cmd('hi SpellBad cterm=underline')
vim.cmd('hi SpellLocal cterm=none')
vim.cmd('hi SpellCap cterm=underline')
vim.cmd('hi SpellRare cterm=underline')

-- Press F10 to debug syntax highlighting under cursor
vim.api.nvim_set_keymap('n', '<F2>',
':echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . "> trans<" . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>',
{ noremap = true, silent = true })

-- Spell checking
vim.cmd([[
  function! IgnoreCamelCaseSpell()
      syn match CamelCase /<[A-Z][a-z]+[A-Z].{-}>/ contains=@NoSpell transparent
      syn cluster Spell add=CamelCase
  endfunction
  autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()
  autocmd FileType markdown setlocal spellcapcheck=
]])

-- Add md as markdown filetype
vim.cmd('autocmd BufNewFile,BufReadPost *.md set filetype=markdown')

-- Automatically add bird tracks for literate programming
-- vim.opt.formatoptions:append('ro')

-- Highlight extra whitespace
vim.cmd('highlight ExtraWhitespace ctermbg=red guibg=red')

-- SCOTT'S STUFF, COPIED FROM INIT.LUA --

-- Tab and indentation settings

-- Leader key and key mappings
vim.cmd('map <leader>h :noh<CR>')         -- Map ",h" to clear search highlights
-- vim.keymap.set('n', '<Up>', 'gk')      -- Map up arrow to move up visual line
-- vim.keymap.set('n', '<Left>', 'gh')    -- Map left arrow to move left visual line
-- vim.keymap.set('n', '<Down>', 'gj')    -- Map down arrow to move down visual line
-- vim.keymap.set('n', '<Right>', 'gl')   -- Map right arrow to move right visual line

-- lazy.nvim setup

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize the Lazy plugin manager with specific options
require('lazy').setup('plugins', {
  -- Configuration for rocks
  rocks = {
    hererocks = false,  -- Disable hererocks
    enabled = false     -- Disable luarocks support completely
  }
})

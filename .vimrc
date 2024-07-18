" classic .vimrc setup, ripped partially from a professor of mine
" current version of my vim configuration can be found in ~/.config/nvim
" this is just a backup for if i break neovim somehow

" general options
set number
set guioptions=
set spell spelllang=en_us
filetype plugin indent on
syntax enable
let mapleader=","
set hlsearch
set incsearch
set showcmd

" tab completion
set wildmode=longest,list,full
set wildmenu

" indentation settings
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i
imap ** (

" remove annoying ex-mode feature
nnoremap Q <nop>

" restore old state of file on reload
au BufWinLeave * mkview
"au BufWinEnter * silent loadview

" syntax highlighting
" set term=xterm-256color

hi clear SpellBad
hi clear SpellLocal
hi clear SpellCap
hi clear SpellRare
hi SpellBad cterm=underline
hi SpellLocal cterm=none
hi SpellCap cterm=underline
hi SpellRare cterm=underline

"hi Comment cterm=none ctermfg=103
"hi Constant cterm=none ctermfg=36
"hi Statement cterm=none ctermfg=green
"
"hi VarId cterm=none ctermfg=7 "122
"hi Identifier cterm=none ctermfg=7
"hi Normal cterm=none ctermfg=7
"
"hi hsType cterm=none ctermfg=130
"hi hsDelimiter cterm=none ctermfg=green

" press F10 to debug syntax highlighting under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" spell checking
fun! IgnoreCamelCaseSpell()
    syn match CamelCase /<[A-Z][a-z]+[A-Z].{-}>/ contains=@NoSpell transparent
    syn cluster Spell add=CamelCase
endfun
autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()

" add md as markdown filetype
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" haskell settings

"au Bufenter *.hs compiler ghc

" configure browser for haskell_doc.vim
"let g:haddock_browser = "/usr/bin/firefox"
"  let g:ghc = "/usr/bin/ghc"
"  let g:haddock_docdir = "/usr/share/doc/ghc-doc/html"
"let g:haddock_browser = "C:/Program Files/Opera/Opera.exe"
"let g:haddock_browser = "C:/Program Files/Mozilla Firefox/firefox.exe"
"let g:haddock_browser = "C:/Program Files/Internet Explorer/IEXPLORE.exe"

" automatically add bird tracks for literate programming
:set formatoptions+=ro

:highlight ExtraWhitespace ctermbg=red guibg=red
" remove trailing whitespaces
"fun! <SID>StripTrailingWhitespaces()
    "let l = line(".")
    "let c = col(".")
    "%s/\s\+$//e
    "call cursor(l, c)
"endfun
"autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Mapping <C-'> to insert a docstring template
function! InsertDocstring()
    " Get the current indentation level
    let l:indent = '    '

    " Create the template with proper indentation
    let l:template = l:indent . '"""' . "\n"
    let l:template .= l:indent . "\n"
    let l:template .= l:indent . "\n"
    let l:template .= l:indent . 'Arguments:' . "\n"
    let l:template .= l:indent . "\n"
    let l:template .= l:indent . 'Returns:' . "\n"
    let l:template .= l:indent . '"""'

    " Append the template to the current line
    call append(line('.'), split(l:template, "\n"))
    normal! j
    normal! ==
endfunction

nnoremap """ <Esc>:call InsertDocstring()<CR>jA

" Disable arrow keys in normal mode
nnoremap <Up>    <Nop>
nnoremap <Down>  <Nop>
nnoremap <Left>  <Nop>
nnoremap <Right> <Nop>

" Disable arrow keys and escape in insert mode
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>

" Disable arrow keys in visual mode
vnoremap <Up>    <Nop>
vnoremap <Down>  <Nop>
vnoremap <Left>  <Nop>
vnoremap <Right> <Nop>

" easy escape
inoremap jj <Esc>

" Function to insert print statement below the current line
function! InsertPrintStatement()
    " Save current cursor position
    let l:save_cursor = getpos('.')

    " Get the variable name under cursor
    let l:variable_name = expand('<cword>')

    " Construct the print statement
    let l:print_statement = 'print(f"DEBUG: ' . l:variable_name . ': {' . l:variable_name . '}")'

    " Move to the end of the current line
    normal! $

    " Insert a new line and add the print statement
    execute "normal! o" . l:print_statement

    " Restore cursor position to where it was originally
    call setpos('.', l:save_cursor)

    " Go back to insert mode
    startinsert
endfunction

" Map 'PR' in insert mode to call InsertPrintStatement
" inoremap PR <Esc>:call InsertPrintStatement()<CR>
nnoremap PR :call InsertPrintStatement()<CR><esc>l

" Override 'cc' mapping for commenting
" inoremap <silent> <C-c><C-c> <Esc>:normal m`^I# <CR>``llli
nnoremap <silent> cc :normal m`^I# <CR>``ll

" Override 'CC' mapping for uncommenting
" inoremap <silent> <C-C><C-c> <Esc>:normal m`^xx<CR>``hi
nnoremap <silent> CC :normal m`^xx<CR>``hh
au BufRead,BufNewFile *.md set filetype=markdown

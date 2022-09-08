filetype off                  " required

set number
set cursorline
set modifiable
set nocompatible              " be iMproved, required
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set nowrap

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
let g:coc_disable_startup_warning = 1

" Emmet
Plugin 'mattn/emmet-vim'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'christoomey/vim-tmux-navigator'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdtree'

" auto complition for c++ c js ts Objective-C go c# java rust php ruby python
" cuda
" Plugin 'valloric/youcompleteme'
" jush a theme
Plugin 'joshdick/onedark.vim'

" auto close brackets
Plugin 'raimondi/delimitmate'

" comments
Plugin 'tpope/vim-commentary'

" all languages syntax support
Plugin 'sheerun/vim-polyglot'

" coc.nvim complition
Plugin 'neoclide/coc.nvim'
" All of your Plugins must be added before the following line

call vundle#end()            " required

" NERDTree
let NERDTreeShowHidden=1

nnoremap <leader>n :NERDTreeFocus<CR>

map <C-n> :call NERDTreeToggleAndRefresh()<CR>

function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

" window settings(making it more obvious)

hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold
hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set relativenumber
    autocmd WinLeave * set norelativenumber
augroup END

" theme settings
syntax on
colorscheme onedark
filetype plugin indent on    " required
hi LineNr ctermfg=red

" Emmet settings
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" coc.nvim rebind
" " Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm()
                              \: "    "


let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-]>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-]>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-]>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-]>l :TmuxNavigateRight<cr>

" Comments
xmap <C-_> <Plug>Commentary
nmap <C-_> <Plug>Commentary
omap <C-_> <Plug>Commentary
nmap <C-_> <Plug>CommentaryLine
nmap <C-__> <Plug>Commentary<Plug>Commentary

vmap <C-c> "+yi<esc>
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p<esc>
imap <C-v> <ESC>"+pa<esc>

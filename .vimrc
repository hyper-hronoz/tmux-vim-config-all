set number
set termguicolors
set cursorline
set modifiable
set nocompatible              " be iMproved, required
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set nowrap
set hlsearch

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" let g:coc_disable_startup_warning = 1

" defx something like neerdtree
Plugin 'shougo/defx.nvim'

" airline line at the bottom of the vim
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'roxma/vim-hug-neovim-rpc'
" Install this plugin
Plugin 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }

" finder 
Plugin 'damage220/vim-finder'

" wilder command mode menu dropdown
Plugin 'gelguy/wilder.nvim'

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
" Plugin 'xolox/vim-misc'
Plugin 'joshdick/onedark.vim'
" Plugin 'kaicataldo/material.vim', { 'branch': 'main' }
" Plugin 'navarasu/onedark.nvim'

" auto close brackets
Plugin 'raimondi/delimitmate'

" comments
Plugin 'tpope/vim-commentary'

" all languages syntax support
Plugin 'sheerun/vim-polyglot'

" coc.nvim complition
" Plugin 'neoclide/coc.nvim'
" All of your Plugins must be added before the following line

" file icons
Plugin 'ryanoasis/vim-devicons'

" fuzzy search
Plugin 'junegunn/fzf'

call vundle#end()            " required

nnoremap <C-p> :FZF<Cr>

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

" Wilder dropdown
call wilder#setup({'modes': [':', '/', '?']})

" call wilder#set_option('pipeline', [
"       \   wilder#branch(
"       \     [
"       \     ],
"       \   ),
"       \ ])

call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ }))

call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<C-n>',
      \ 'previous_key': '<C-p>',
      \ 'accept_key': '<Tab>',
      \ 'reject_key': '<>',
      \ })

call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlights': {
      \   'border': 'Normal',
      \ },
      \ 'border': 'rounded',
      \ })))

call wilder#setup({'modes': [':', '/', '?']})

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'fuzzy': 1,
      \       'set_pcre2_pattern': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': 'fuzzy',
      \     }),
      \   ),
      \ ])

let s:highlighters = [
        \ wilder#pcre2_highlighter(),
        \ wilder#basic_highlighter(),
        \ ]

" theme settings
syntax on
let g:onedark_config = {
    \ 'style': 'darker',
\}
colorscheme onedark
filetype plugin indent on    " required

" vim windows resizing
noremap <silent> <C-h> :vertical resize -10<CR>
noremap <silent> <C-l> :vertical resize +10<CR>
noremap <silent> <C-j> :resize -10<CR>
noremap <silent> <C-k> :resize +10<CR>

" defx
call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': 'defxplorer',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

" Toggle Defx using Ctrl + Space
map <C-space> :Defx<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction 


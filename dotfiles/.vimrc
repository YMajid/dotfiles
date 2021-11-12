set clipboard=unnamed

" Terminal settings
:set splitbelow
:set termwinsize=10x0

" Simple Editor Settings
:set autoindent
:set smartindent
:set showmatch
:set noerrorbells
:set smartcase
:set noswapfile
:set nobackup
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set expandtab
:set incsearch
:set nu
:set clipboard=unnamedplus
:set encoding=utf-8

" Vimwiki settings
set nocompatible
filetype plugin on
syntax on

" Plug settings
let g:plugWinPos = "right"

" NerdTree Settings
let g:NERDTreeWinPos = "left"
au VimEnter *  NERDTree

" Cursor Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" Disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" Don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" Run go imports on file save
let g:go_fmt_command = "goimports"

" Automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

" Remove all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Scala
let g:scala_scaladoc_indent = 1

" Golang
au filetype go inoremap <buffer> . .<C-x><C-o>

"---------------------------------------------------------------------------------------------------

" coc Settings
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"---------------------------------------------------------------------------------------------------

" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
" 	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif


call plug#begin('~/.vim/plugged')

Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'morhetz/gruvbox'
Plug 'vim-pandoc/vim-pandoc'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'thosakwe/vim-flutter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'dart-lang/dart-vim-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
Plug 'derekwyatt/vim-scala'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
autocmd FileType json syntax match Comment +\/\/.\+$+

call plug#end()

" Shortcuts
map <C-n> :NERDTreeToggle<CR>

" Autoformatting
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

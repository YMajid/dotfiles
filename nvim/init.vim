" Basic Configs
set number
set relativenumber
set autoindent
set hidden
set smarttab
set tabstop=2
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
set expandtab
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300

nnoremap \ :noh<return>

" Vim-Plug
call plug#begin()

" Themes
Plug 'flazz/vim-colorschemes'
Plug 'bryanmylee/vim-colorscheme-icons'
Plug 'cocopon/iceberg.vim'
Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
Plug 'vim-airline/vim-airline-themes'

" Interface
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-airline/vim-airline'
Plug 'justinmk/vim-sneak'
Plug 'godlygeek/tabular'

" Language Tools
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'lervag/vimtex'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'katusk/vim-qkdb-syntax'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Language Specific Tools
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'derekwyatt/vim-scala'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

call plug#end()

" Themes
set termguicolors
set background=dark
"let g:aqua_bold = 0
"let g:aquarium_style="dark"
let g:airline_theme="base16_aquarium_dark"
colorscheme iceberg

" NerdTree Settings
let g:NERDTreeWinPos = "left"
au VimEnter *  NERDTree
map <C-n> :NERDTreeToggle<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Autoformatter Settings
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

" Doge
let g:doge_mapping = ',g'
let g:doge_enable_mappings = 1
let g:doge_doc_standard_python = 'google'
let g:doge_python_settings = {'single_quotes': 0}


" q
syntax on
hi Special ctermfg=red " for query specific keywords
hi Underlined ctermfg=magenta cterm=bold " for local variables
set tags=tags;

" LaTeX
filetype plugin indent on
syntax enable
let g:vimtex_view_general_viewer = 'xdg-open'
let maplocalleader = ","

" Git
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

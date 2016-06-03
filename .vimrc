" General
" =============================================================================
set nocompatible
syntax enable
filetype off
set nobackup
set noswapfile
set relativenumber
set laststatus=2
set encoding=utf-8
set fillchars=vert:\┃
set noshowmode
set backspace=indent,eol,start
set mouse=a
set showcmd
set tabstop=4

if has("gui_running")
  set guifont=Fira\ Mono\ Medium\ for\ Powerline:h11
  set guioptions=''
else
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set t_Co=256
endif

if &shell =~# 'fish$'
  set shell=bash
endif

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

let g:python_host_prog = '/usr/bin/python'

" Plugins
" =============================================================================
let s:vimplugindir = $HOME . "/.vimplugins"

call plug#begin(s:vimplugindir)

" Color Schemes
Plug 'NLKNguyen/papercolor-theme'

Plug 'Raimondi/delimitMate'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/unite-outline'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --gocode-completer --tern-completer --racer-completer'}
Plug 'dhruvasagar/vim-prosession', {'on': 'Prosession'}
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'mhinz/vim-signify'
Plug 'benekastah/neomake'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/bufkill.vim', {'on': 'BD'}
Plug 'dag/vim-fish'
Plug 'janko-m/vim-test'
Plug 'vim-airline/vim-airline'

" Rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'cespare/vim-toml', {'for': 'toml'}

" Python
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'hdima/python-syntax', {'for': 'python'}
Plug 'jmcantrell/vim-virtualenv'

" Go
Plug 'fatih/vim-go', {'for': 'go'}

" Ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'hallison/vim-rdoc', {'for': 'rdoc'}
Plug 'tpope/vim-bundler'

" Javascript
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}

" Stylesheets
Plug 'wavded/vim-stylus', {'for': 'stylus'}
Plug 'groenewege/vim-less', {'for': 'less'}
Plug 'sophacles/vim-bundle-mako', {'for': 'mako'}

" Miscellaneous Filetypes
Plug 'Glench/Vim-Jinja2-Syntax', {'for': 'jinja'}
Plug 'LeonB/vim-nginx', {'for': 'nginx'}
Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfile'}
Plug 'juvenn/mustache.vim', {'for': 'html'}
Plug 'chase/vim-ansible-yaml'

" Markdown
Plug 'tpope/vim-markdown', {'for': 'markdown'}

call plug#end()            " required

" Bootstrap plugins
if !isdirectory(s:vimplugindir)
  PlugInstall
endif

" Navigation
" =============================================================================
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>
nnoremap <Leader>tc :tabnew<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bl :Unite buffer<CR>
nnoremap <Leader>ln :lnext<CR>
nnoremap <Leader>lp :lprevious<CR>

" Fugitive
" =============================================================================
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gr :Gread<CR>

" vim-test
" =============================================================================
nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>tn :TestNearest<CR>
nnoremap <Leader>ts :TestSuite<CR>

" Markdown
" =============================================================================
let g:markdown_fenced_languages = ['sql', 'yaml']

" YouCompleteMe
" =============================================================================
nnoremap <Leader>d :YcmCompleter GoToDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = substitute(system("fish -c 'which python'"), '\n\+$', '', '')
let g:ycm_rust_src_path = '/usr/local/rust/rustc-1.8.0/src'
let g:ycm_semantic_triggers =  {
    \   'css': ['    ', ': '],
    \ }

" Unite
" =============================================================================
" General
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_prompt='» '
" Code Search
nnoremap <silent> <Leader>/ :<C-u>Unite grep:! -buffer-name=search-buffer<CR>
if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--vimgrep --hidden --ignore ' .
    \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif
" File Search

nnoremap <Leader>p :Unite file_rec/git:--others:--cached:--exclude-standard
  \ -start-insert<CR>
" Tags
nnoremap <Leader>c :Unite outline -vertical -direction=dynamicbottom<CR>

" VimFiler
" =============================================================================
nnoremap <Leader>e :VimFilerExplorer -winwidth=60<CR>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_ignore_pattern = '\(__pycache__\|egg\|\.pyc$\|^\.\|\.gz$\)'
function! s:vimfiler_my_settings() "{{{
  nmap <buffer> <2-LeftMouse> <Plug>(vimfiler_expand_or_edit)
  set norelativenumber
"}}}
endfunction
au FileType vimfiler call s:vimfiler_my_settings()

" Misc
" =============================================================================

set background=dark
colorscheme PaperColor

let python_highlight_all = 1

if has('nvim')
  let g:test#strategy = "neovim"
else
  let g:test#strategy = "vimshell"
end

let g:airline_theme='PaperColor'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

autocmd! BufWritePost * Neomake

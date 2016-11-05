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
set background=light

if has("gui_running")
  set guifont=Fira\ Mono\ Medium\ for\ Powerline:h11
  set guioptions=''
else
  set termguicolors
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
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'

" File/Project Management
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe',
  \ {'do': './install.py --gocode-completer --tern-completer --racer-completer'}
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
Plug 'mgrabovsky/vim-cuesheet', {'for': 'cuesheet'}

" Rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'cespare/vim-toml', {'for': 'toml'}

" Python
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'hdima/python-syntax'
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
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
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

if has('nvim')
  let g:test#strategy = "neovim"
else
  let g:test#strategy = "vimshell"
end

" Markdown
" =============================================================================
let g:markdown_fenced_languages = ['sql', 'yaml']

" vim-ruby
" =============================================================================
let g:rubycomplete_buffer_loading = 1
" let g:rubycomplete_rails = 1
let g:rubycomplete_use_bundler = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_debug = 1

" YouCompleteMe
" =============================================================================
nnoremap <Leader>d :YcmCompleter GoToDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = substitute(system("fish -c 'which python'"), '\n\+$', '', '')
let g:ycm_rust_src_path = '/usr/local/rust/rustc-1.11.0/src'
let g:ycm_semantic_triggers =  {
    \   'css': ['    ', ': '],
    \ }

" fzf.vim
" =============================================================================
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>/ :Rg 

" Neomake
" =============================================================================
autocmd! BufWritePost * Neomake

function! neomake#makers#ft#ruby#rubocop()
  return {
      \ 'exe': 'bundle',
      \ 'args': ['exec', 'rubocop', '--format', 'emacs'],
      \ 'errorformat': '%f:%l:%c: %t: %m',
      \ 'postprocess': function('neomake#makers#ft#ruby#RubocopEntryProcess')
      \ }
endfunction

" Misc
" =============================================================================

colorscheme PaperColor

let python_highlight_all = 1

command! RubocopAutoCorrect
  \ execute ':silent ! bundle exec rubocop --auto-correct % > /dev/null 2>&1'

command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" General
" =============================================================================
set nocompatible
set list
set listchars=eol:⏎
syntax enable
filetype off
set nobackup
set noswapfile
set relativenumber
set laststatus=2
set encoding=utf-8
set fillchars+=vert:\ 
set backspace=indent,eol,start
set mouse=a
set showcmd
set tabstop=4
if has("gui_running")
  set guifont=Droid\ Sans\ Mono\ for\ Powerline
  set guioptions=''
else
  let g:gruvbox_italic=0 
  set background=dark
  set t_Co=256
endif

" Plugins
" =============================================================================

let s:vimplugindir = $HOME . "/.vimplugins"

call plug#begin(s:vimplugindir)

Plug 'Glench/Vim-Jinja2-Syntax', {'for': 'jinja'}
Plug 'LeonB/vim-nginx', {'for': 'nginx'}
Plug 'hdima/python-syntax', {'for': 'python'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim', {'on': 'VimFilerExplorer'}
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'SirVer/UltiSnips'
Plug 'Valloric/YouCompleteMe', {'do': './install.sh'}
Plug 'bling/vim-airline'
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'chase/vim-ansible-yaml'
Plug 'dhruvasagar/vim-prosession', {'on': 'Prosession'}
Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfile'}
Plug 'groenewege/vim-less'
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'junegunn/limelight.vim', {'on': 'Limelight'}
Plug 'juvenn/mustache.vim', {'for': 'html'}
Plug 'majutsushi/tagbar'
Plug 'marijnh/tern_for_vim', {'for': 'javascript', 'do': 'npm install'}
Plug 'mhinz/vim-signify'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'phildawes/racer', {'do': 'cargo build --release', 'for': 'rust'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'scrooloose/syntastic'
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
Plug 'sophacles/vim-bundle-mako', {'for': 'mako'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sleuth'
Plug 'vim-php/tagbar-phpctags.vim'
Plug 'vim-scripts/bufkill.vim', {'on': 'BD'}
Plug 'wavded/vim-stylus', {'for': 'stylus'}

call plug#end()            " required

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

" YouCompleteMe
" =============================================================================
nnoremap <Leader>d :YcmCompleter GoToDeclaration<CR>
let g:ycm_semantic_triggers =  {
    \   'css': ['    ', ': '],
    \   'rust': ['::', '.'],
    \ }

" Goyo and Limelight
" =============================================================================
function! GoyoBefore()
  Limelight
  set nolist
endfunction

function! GoyoAfter()
  Limelight!
  set list
endfunction

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]
let g:limelight_conceal_ctermfg = 'DarkGray'
nnoremap <Leader>l :Limelight!!<CR>
nnoremap <Leader><Space> :Goyo<CR>

" Unite
" =============================================================================
" General
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_prompt='» '
" Code Search
nnoremap <silent> <Leader>/ :<C-u>Unite grep:! -buffer-name=search-buffer<CR>
" File Search
if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
  \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_rec_async_command =
                  \ 'ag --follow --nocolor --nogroup --hidden -g ""'
endif
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern',
  \ '\(\.tox\|node_modules\|__pycache__\|\.egg\|\.gz$\)')
nnoremap <Leader>p :Unite -start-insert file_rec/async<CR>

" VimFiler
" =============================================================================
nnoremap <Leader>e :VimFilerExplorer<CR>
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = '\(__pycache__\|egg\|^\.\|\.gz$\)'
function! s:vimfiler_my_settings() "{{{
  nmap <buffer> <2-LeftMouse> <Plug>(vimfiler_expand_or_edit)
  set norelativenumber
"}}}
endfunction
au FileType vimfiler call s:vimfiler_my_settings()

" Ultisnips
" =============================================================================
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]

" Syntastic
" =============================================================================
let g:syntastic_always_populate_loc_list=1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args="--max-complexity 10"
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "⚠"
let g:syntastic_style_warning_symbol = "⚠"

" vim-airline
" =============================================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'papercolor'
let g:airline_powerline_fonts = 1

" Tagbar
" =============================================================================
nmap <F8> :TagbarToggle<CR>
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_compact = 1

" Misc
" =============================================================================

colorscheme PaperColor

let python_highlight_all = 1

let g:virtualenv_directory='~/.env'

let g:indent_guides_enable_on_vim_startup = 1

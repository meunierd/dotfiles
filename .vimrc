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
set backspace=indent,eol,start
set mouse=a
set showcmd
set tabstop=4
" set list
" set listchars=eol:\u23CE

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

" Plugins
" =============================================================================
let s:vimplugindir = $HOME . "/.vimplugins"

call plug#begin(s:vimplugindir)

" Color Schemes
Plug 'mhartington/oceanic-next'
Plug 'NLKNguyen/papercolor-theme'

Plug 'Raimondi/delimitMate'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim', {'on': 'VimFilerExplorer'}
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/unite-outline'
Plug 'SirVer/UltiSnips'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --gocode-completer --tern-completer --racer-completer'}
Plug 'bling/vim-airline'
Plug 'dhruvasagar/vim-prosession', {'on': 'Prosession'}
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'junegunn/limelight.vim', {'on': 'Limelight'}
Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sleuth'
Plug 'vim-scripts/bufkill.vim', {'on': 'BD'}
Plug 'dag/vim-fish'

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

" Markdown
" =============================================================================
let g:markdown_fenced_languages = ['sql', 'yaml']

" YouCompleteMe
" =============================================================================
nnoremap <Leader>d :YcmCompleter GoToDeclaration<CR>
let g:ycm_rust_src_path = '/usr/local/rust/rust-1.5.0/src'
let g:ycm_semantic_triggers =  {
    \   'css': ['    ', ': '],
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
let g:limelight_conceal_guifg = '#777777'
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
if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--vimgrep --hidden --ignore ' .
    \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif
" File Search

if has('nvim')
  nnoremap <Leader>p :Unite file_rec/neovim -start-insert<CR>
else
  nnoremap <Leader>p :Unite file_rec/git:--others:--cached:--exclude-standard
    \ -start-insert<CR>
endif
" Tags
nnoremap <Leader>c :Unite outline -vertical -direction=dynamicbottom<CR>

" VimFiler
" =============================================================================
nnoremap <Leader>e :VimFilerExplorer<CR>
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = '\(__pycache__\|egg\|\.pyc$\|^\.\|\.gz$\)'
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
let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_python_flake8_args="--max-complexity 10"
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "⚠"
let g:syntastic_style_warning_symbol = "⚠"

" vim-airline
" =============================================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme='PaperColor'

" Misc
" =============================================================================

set background=dark
colorscheme PaperColor

let python_highlight_all = 1
let g:virtualenv_directory='~/.env'
let g:indent_guides_enable_on_vim_startup = 1
let g:racer_cmd='~/.local/src/racer/target/release/racer'

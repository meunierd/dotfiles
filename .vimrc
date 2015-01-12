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
call plug#begin('~/.vim/bundle')

Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'LeonB/vim-nginx', {'for': 'nginx'}
Plug 'Matt-Stevens/vim-systemd-syntax'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'SirVer/UltiSnips'
Plug 'Valloric/YouCompleteMe', {'do': './install.sh'}
Plug 'bling/vim-airline'
Plug 'chase/vim-ansible-yaml'
Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfile'}
Plug 'groenewege/vim-less'
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'junegunn/limelight.vim', {'on': 'Limelight'}
Plug 'junegunn/vim-easy-align'
Plug 'juvenn/mustache.vim'
Plug 'majutsushi/tagbar'
Plug 'marijnh/tern_for_vim', {'for': 'javascript', 'do': 'npm install'}
Plug 'mhinz/vim-signify'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
Plug 'shawncplus/phpcomplete.vim'
Plug 'sophacles/vim-bundle-mako', {'for': 'mako'}
Plug 'szw/vim-ctrlspace'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'vim-scripts/bufkill.vim', {'on': 'BD'}
Plug 'wavded/vim-stylus'

call plug#end()            " required

" Bootstrap Plugins
" =============================================================================
if !isdirectory($HOME . "/.vim/bundle")
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
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

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
if executable('pt')
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_encoding = 'utf-8'
endif
" File Search
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
let g:UltiSnipsExpandTrigger="<tab>"
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
let g:airline_powerline_fonts = 1

" Tagbar
" =============================================================================
nmap <F8> :TagbarToggle<CR>
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_compact = 1

" Misc
" =============================================================================

colorscheme gruvbox

let g:virtualenv_directory='~/.env'

let g:indent_guides_enable_on_vim_startup = 1

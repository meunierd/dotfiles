" General
" =============================================================================
set encoding=utf-8
scriptencoding utf-8
syntax enable
filetype plugin indent on
set nobackup
set noswapfile
set relativenumber
set laststatus=2
set fillchars=vert:\┃
set noshowmode
set backspace=indent,eol,start
set mouse=a
set showcmd
set tabstop=4
set background=dark
set signcolumn=yes
au BufNewFile,BufRead *.ejson setfiletype json

let g:python3_host_prog='/Users/meunierd/.pyenv/versions/3.6.1/bin/python'

if has('gui_running')
  set guifont=Fira\ Mono\ Medium\ for\ Powerline:h11
  set guioptions=''
else
  if has('nvim')
    set termguicolors
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=2
  end
  set t_Co=256
endif

if &shell =~# 'fish$'
  set shell=bash
endif

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

call plug#begin('~/.vimpkg/bundle')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Raimondi/delimitMate'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'cespare/vim-toml'
Plug 'dag/vim-fish'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'janko-m/vim-test'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kchmck/vim-coffee-script'
Plug 'majutsushi/tagbar'
Plug 'mgrabovsky/vim-cuesheet'
Plug 'mhinz/vim-signify'
Plug 'pangloss/vim-javascript'
Plug 'roxma/nvim-completion-manager'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'

call plug#end()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Navigation
" =============================================================================
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>ln :lnext<CR>
nnoremap <Leader>lp :lprevious<CR>

" vim-test
" =============================================================================
let g:test#strategy = 'neovim'

nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>tn :TestNearest<CR>
nnoremap <Leader>ts :TestSuite<CR>

" Markdown
" =============================================================================
let g:markdown_fenced_languages = ['sql', 'yaml', 'graphql', 'json']

" vim-ruby
" =============================================================================
let g:ruby_indent_assignment_style = 'variable'

" fzf.vim
" =============================================================================
command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1, <bang>0)

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>sW :execute ":Rg  " . expand("<cWORD>")<CR>
nnoremap <Leader>sw :execute ":Rg  " . expand("<cword>")<CR>

" vim-airline
" =============================================================================
let g:airline_left_sep = '»'
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = '«'
let g:airline_right_alt_sep = '|'
let g:airline_theme='papercolor'

" ale
" =============================================================================
let g:ale_linters = {'java': []}
let g:ale_fixers = {'ruby': 'rubocop'}
let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_executable = 'bin/rubocop'
let g:ale_sign_column_always = 1
let g:ale_sign_warning = '->'
let g:ale_sign_error = '=>'

" LanguageClient
" =============================================================================
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
  \ 'python': ['pyls'],
  \ 'java': [
  \   'java',
  \   '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044',
  \   '-Declipse.application=org.eclipse.jdt.ls.core.id1',
  \   '-Dosgi.bundles.defaultStartLevel=4',
  \   '-Declipse.product=org.eclipse.jdt.ls.core.product',
  \   '-Dlog.protocol=true',
  \   '-Dlog.level=ALL',
  \   '-noverify',
  \   '-Xmx1G',
  \   '-jar',
  \   '/Users/meunierd/src/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar',
  \   '-configuration',
  \   '/Users/meunierd/src/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_mac',
  \   '-data',
  \   '/Users/meunierd/.eclipse'
  \ ],
  \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
  \ 'typescript': ['./node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
  \ 'javascript': ['./node_modules/javascript-typescript-langserver/lib/language-server-stdio.js']
  \}
nnoremap <Leader>h :call LanguageClient_textDocument_hover()<CR>
nnoremap <Leader>d :call LanguageClient_textDocument_definition()<CR>

" Misc
" =============================================================================
nnoremap <Leader>e :NERDTreeToggle<CR>

colorscheme PaperColor
let g:python_highlight_all = 1
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
command! JSONFormat
  \ execute ':%!python -m json.tool'

" Configure Tagbar to user ripper-tags with ruby
let g:tagbar_type_ruby = {
            \ 'kinds' : [
                \ 'm:modules',
                \ 'c:classes',
                \ 'f:methods',
                \ 'F:singleton methods',
                \ 'C:constants',
                \ 'a:aliases'
            \ ],
            \ 'ctagsbin':  'ripper-tags',
            \ 'ctagsargs': ['-f', '-']
            \ }

" nvim-completion manager
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set formatexpr=LanguageClient_textDocument_rangeFormatting()
let g:rustc_path = 'cargo rustc --'

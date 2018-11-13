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
set termguicolors
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set t_Co=256

au BufNewFile,BufRead *.ejson setfiletype json
au BufRead,BufNewFile Pipfile setfiletype toml

if &shell =~# 'fish$'
  set shell=bash
endif

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

call plug#begin('~/.vimpkg/bundle')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Raimondi/delimitMate'
Plug 'cespare/vim-toml'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'hashivim/vim-terraform'
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'janko-m/vim-test'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vader.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'majutsushi/tagbar'
Plug 'mgrabovsky/vim-cuesheet'
Plug 'mhinz/vim-signify'
Plug 'pangloss/vim-javascript'
Plug 'uarun/vim-protobuf'
Plug 'leafgarland/typescript-vim'
Plug 'morhetz/gruvbox'
Plug 'jparise/vim-graphql'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-abbrfuzzy'
Plug 'roxma/nvim-yarp'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-dadbod'

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

" vim-plug
" =============================================================================
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>
nnoremap <Leader>pU :PlugUpgrade<CR>

" Markdown
" =============================================================================
let g:markdown_fenced_languages = ['sql', 'yaml', 'json']

" vim-ruby
" =============================================================================
let g:ruby_indent_assignment_style = 'variable'

" fzf.vim
" =============================================================================
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>sW :execute ":Rg  " . expand("<cWORD>")<CR>
nnoremap <Leader>sw :execute ":Rg  " . expand("<cword>")<CR>

" ncm2
" =============================================================================
set shortmess+=c
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let ncm2#matcher = 'abbrfuzzy'
let ncm2#sorter = 'abbrfuzzy'

" vim-airline
" =============================================================================
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" ale
" =============================================================================
let g:ale_linters = {'fish': [], 'python': ['pyls']}
let g:ale_fixers = {'ruby': 'rubocop', 'sql': 'sqlfmt'}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_ruby_rubocop_executable = 'bin/rubocop'
let g:ale_java_javalsp_jar = '/Users/meunierd/src/java-language-server/out/fat-jar.jar'
let g:ale_sign_column_always = 1
nnoremap <Leader>ah :ALEHover<CR>
nnoremap <Leader>ag :ALEGoToDefinition<CR>

" Formatting
" =============================================================================
command! JSONFormat
  \ execute ':%!python -m json.tool'
command! URLDecode
  \ execute ':%!python2 -c "import sys, urllib as ul; print ul.unquote_plus(sys.stdin.read())"'

" Git
" =============================================================================

let g:gina#command#blame#formatter#format = '%au %=on %ti %ma%in'
nnoremap <Leader>gb :Gina blame<CR>
nnoremap <Leader>gB :Gina browse :<CR>
nnoremap <Leader>gw :Gina add %<CR>

" Misc
" =============================================================================
nnoremap <Leader>e :NERDTreeToggle<CR>

colorscheme gruvbox
let g:python_highlight_all = 1
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

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

let g:rustc_path = 'cargo rustc --'

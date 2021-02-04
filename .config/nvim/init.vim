" General
" =============================================================================
set encoding=utf-8
scriptencoding utf-8
syntax enable
filetype plugin indent on
set exrc
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
au BufNewFile,BufRead *.lpl setfiletype json
au BufRead,BufNewFile Pipfile setfiletype toml
au BufReadPre *.nfo :setlocal fileencodings=cp437,utf-8
au BufReadPre *.nfo :setlocal norelativenumber

if &shell =~# 'fish$'
  set shell=bash
endif

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

call plug#begin('~/.vimpkg/bundle')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'janko-m/vim-test'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vader.vim'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-dadbod'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
if has('mac')
  Plug 'Shopify/shadowenv.vim'
endif
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'

" Language Support + Syntax Highlighting
Plug 'cespare/vim-toml'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go'
Plug 'uarun/vim-protobuf'
Plug 'mgrabovsky/vim-cuesheet'
Plug 'kchmck/vim-coffee-script'
Plug 'rhysd/vim-syntax-codeowners'
Plug 'tpope/vim-markdown'
Plug 'alisdair/vim-armasm'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'hdima/python-syntax'
Plug 'jparise/vim-graphql'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-bundler'

call plug#end()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <Leader>a <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <Leader>a <Plug>(EasyAlign)

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
nnoremap <Leader>tl :TestLast<CR>
nnoremap <Leader>tn :TestNearest<CR>
nnoremap <Leader>ts :TestSuite<CR>

" vim-plug
" =============================================================================
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>
nnoremap <Leader>pU :PlugUpgrade<CR>
let g:plug_window = 'split new'

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

" vim-airline
" =============================================================================
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" ale
" =============================================================================
let g:ale_linters = {'fish': [], 'ruby': ['rubocop']}
let g:ale_fixers = {'ruby': 'rubocop', 'sql': 'sqlfmt'}
let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1
let g:ale_ruby_rubocop_executable = 'bin/rubocop'
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
nnoremap <Leader>gs :Gina status<CR>
nnoremap <Leader>gB :Gina browse :<CR>
nnoremap <Leader>gw :w<CR>:Gina add %<CR>
nnoremap <Leader>gc :Gina commit<CR>ggi
nnoremap <Leader>gp :Gina push -u origin HEAD<CR>
nnoremap <Leader>gP :Gina push -u origin HEAD --force<CR>
xmap <Leader>gB :Gina browse :<CR>

" Misc
" =============================================================================
colorscheme gruvbox
let g:python_highlight_all = 1
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

nnoremap <Leader>T :terminal fish<CR>

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

let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

augroup format_ruby
  autocmd Syntax ruby syn region sorbetSig start='sig {' end='}'
  autocmd Syntax ruby syn region sorbetSigDo start='sig do' end='end'
  autocmd Syntax ruby hi def link sorbetSig Comment
  autocmd Syntax ruby hi def link sorbetSigDo Comment
augroup END

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" set updatetime=500
" autocmd CursorHold * silent call CocActionAsync('doHover')
let g:coc_disable_startup_warning = 1
if !has('mac')
  let g:coc_node_path = '/usr/bin/nodejs'
endif
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

augroup neovim_terminal
    autocmd!
    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
    " allows you to use Ctrl-c on terminal window
    autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END

" General
" =============================================================================
set encoding=utf-8
scriptencoding utf-8
syntax enable
filetype plugin indent on
set exrc
set nobackup
set noswapfile
set laststatus=2
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

if $SPIN == 1
    let g:clipboard = {
        \ 'name': 'pbcopy',
        \ 'copy': {'+': 'pbcopy', '*': 'pbcopy'},
        \ 'paste': {'+': 'pbpaste', '*': 'pbpaste'},
        \ 'cache_enabled': 1 }
end

" if &shell =~# 'fish$'
"   set shell=bash
" endif

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

call plug#begin('~/.config/nvim/plugins')

Plug 'nvim-lua/plenary.nvim'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'akinsho/bufferline.nvim'

" LSP + Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'suketa/nvim-dap-ruby'

Plug 'williamboman/nvim-lsp-installer'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'janko-m/vim-test'
Plug 'jmcantrell/vim-virtualenv'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-dispatch'
if has('mac')
  Plug 'Shopify/shadowenv.vim'
endif

" Colorschemes
Plug 'morhetz/gruvbox'

" Language Support + Syntax Highlighting
Plug 'cespare/vim-toml'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
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

Plug 'f-person/git-blame.nvim'
Plug 'dinhhuy258/git.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

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
nnoremap <Leader>f <cmd>Telescope find_files<cr>
nnoremap <Leader>/ <cmd>Telescope live_grep<cr>
nnoremap <leader>sw <cmd>lua require('telescope.builtin').grep_string({search = vim.fn.expand("<cword>")})<cr>

" vim-airline
" =============================================================================
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" ale
" =============================================================================
let g:ale_linters = {
\   'fish': [],
\   'ruby': ['rubocop'],
\}
let g:ale_fixers = {
\   'ruby': 'rubocop',
\   'sql': 'sqlfmt',
\   'python': ['black']
\}
let g:ale_fix_on_save = 1
let g:ale_python_black_auto_pipenv = 1
let g:ale_python_auto_pipenv = 1
let g:ale_ruby_rubocop_executable = 'bin/rubocop'
let g:ale_sign_column_always = 1
nnoremap <Leader>ah :ALEHover<CR>
nnoremap <Leader>ag :ALEGoToDefinition<CR>

nnoremap <Leader>e :NvimTreeToggle<CR>

" Formatting
" =============================================================================
command! JSONFormat
  \ execute ':%!python3 -m json.tool'
command! URLDecode
  \ execute ':%!python2 -c "import sys, urllib as ul; print ul.unquote_plus(sys.stdin.read())"'

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

augroup neovim_terminal
    autocmd!
    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
    " allows you to use Ctrl-c on terminal window
    autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END

lua << EOF

-- Setup nvim-cmp.
  require'nvim-tree'.setup()
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
  end

  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  require'lspconfig'.pylsp.setup{
    on_attach = on_attach,
    capabilities = capabilities
  }
  require'lspconfig'.sorbet.setup{
    on_attach = on_attach,
    capabilities = capabilities
  }
  require'lspconfig'.gopls.setup{
    on_attach = on_attach,
    capabilities = capabilities
  }

  require("bufferline").setup{}
  require('git').setup()
  require('dap-ruby').setup()
EOF

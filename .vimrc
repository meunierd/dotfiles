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
  if has('nvim')
    set termguicolors
  end
  set t_Co=256
endif

if &shell =~# 'fish$'
  set shell=bash
endif

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

let g:python_host_prog = '/usr/bin/python'

execute pathogen#infect()
call pathogen#helptags()

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
nnoremap <Leader>f :Files<CR>
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

" vim-airline
" =============================================================================
let g:airline_left_sep = '»'
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = '«'
let g:airline_right_alt_sep = '|'

" Misc
" =============================================================================

nnoremap <Leader>e :NERDTreeToggle<CR>

colorscheme PaperColor
let python_highlight_all = 1

command! RubocopAutoCorrect
  \ execute ':silent ! bundle exec rubocop --auto-correct % > /dev/null 2>&1'

command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1, <bang>0)
execute pathogen#infect()
call pathogen#helptags()

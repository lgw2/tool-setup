set number
set ruler
set visualbell
set textwidth=79
set hlsearch
set shiftwidth=4
set clipboard=unnamed
au Filetype python set
     \ tabstop=4
     \ smarttab
     \ smartindent
     \ expandtab
     \ softtabstop=4
     \ textwidth=79

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Using vim-plug as plugin manager
call plug#begin('~/.vim/plugged')

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" syntax checking
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
let g:flake8_show_in_gutter=1  " show
autocmd BufWritePost *.py call flake8#Flake8()

" plugins become visible to vim after this call
call plug#end()

set number
set ruler
set visualbell
set textwidth=79
set hlsearch
set shiftwidth=4
set clipboard=unnamed
set tabstop=4
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

" Install plug if not there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"save folds
augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent loadview
augroup END

" skeleton tex file
augroup templates
	autocmd BufNewFile *.tex r ~/.vim/skeletons/skeleton.tex
augroup END

" allow colors for status bar
set t_Co=256
let g:airline_powerline_fonts = 1
" use solarized dark theme
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'

" Using vim-plug as plugin manager
call plug#begin('~/.vim/plugged')

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" syntax checking
Plug 'nvie/vim-flake8'
let g:flake8_show_in_gutter=1  " show
autocmd BufWritePost *.py call flake8#Flake8()

"vim-slime
Plug 'jpalardy/vim-slime'

" use git
Plug 'tpope/vim-fugitive'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" plugins become visible to vim after this call
call plug#end()

"set vim-slime to use tmux
let g:slime_target = "tmux"



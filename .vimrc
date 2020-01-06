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


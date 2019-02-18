" Config
set number
color desert
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
set nrformats+=alpha
let g:NERDTreeMapOpenInTabSilent = 'T'
set autoindent

" CtrlP map 
set runtimepath^=~/.vim/bundle/ctrlp.vim

" CSS Autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=2 tabstop=2 colorcolumn=79
      \ formatoptions+=croq softtabstop=2
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

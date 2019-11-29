" Config
set number
color desert
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
set nrformats+=alpha
set autoindent
set mouse=a

" Some of these key choices were arbitrary;
" it's just an example.
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>
let dart_format_on_save = 1

let g:lsc_server_commands = {'dart': '~/dev/dart-sdk/bin/dart ~/dev/dart-sdk/bin/snapshots/analysis_server.dart.snapshot --lsp'}
let g:lsc_auto_map = v:true " Use defaults


" Maralla completor
" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.

" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
function! Tab_Or_Complete() abort
  " If completor is already open the `tab` cycles through suggested completions.
  if pumvisible()
    return "\<C-N>"
  " If completor is not open and we are in the middle of typing a word then
  " `tab` opens completor menu.
  elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^[[:keyword:][:ident:]]'
    return "\<C-R>=completor#do('complete')\<CR>"
  else
    " If we aren't typing a word and we press `tab` simply do the normal `tab`
    " action.
    return "\<Tab>"
  endif
endfunction

" Use `tab` key to select completions.  Default is arrow keys.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use tab to trigger auto completion.  Default suggests completions as you type.
let g:completor_auto_trigger = 0
inoremap <expr> <Tab> Tab_Or_Complete()

" NERDTree map {
" aut start nerdtree
" autocmd vimenter * NERDTree

let g:NERDTreeMapOpenInTabSilent = 'T'
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeMouseMode=3

" toggle nerd tree
nmap <leader>m :NERDTreeRefreshRoot %<CR>


" }

" CtrlP map {

set shell=/bin/bash
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40


let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$|backup',
\ 'file': '\.so$\|\.dat$|\.DS_Store$'
\ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME.'/.vim/.cache/ctrlp'
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

map <leader>op :CtrlP<cr>
map <leader>ol  :CtrlPClearCache<cr>
map <leader>opc :CtrlPCurFile<cr>
map <leader>opb :CtrlPBuffer<cr>
map <leader>opd :CtrlPDir<cr>
map <leader>opl :CtrlPLine<cr>
map <leader>opff :CtrlPChangeAll<cr>
map <leader>opfb :CtrlPChange<cr>

" }

" Fuzzy MRU map {
  map <leader>p :FZFMru<cr>
"

" Ag Search with leader f map instead of grep.vim {
  map <leader>f :Ag<cr>
  let g:ag_working_path_mode="r"
  let g:ag_prg="<custom-ag-path-goes-here> --vimgrep"
" } }

" CSS Autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=2 tabstop=2 colorcolumn=79
      \ formatoptions+=croq softtabstop=2
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" mappping up/down selected text
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

" disable swap file
set noswapfile

" format json
vmap <S-f> :%!python -m json.tool <CR>

" mapping for lazy things
" console.log
:map <leader>ll yiwo<Esc>iconsole.log('<Esc>p<Esc>a====> <Esc>f)i, <Esc>p<Esc>==:w<CR>
" debugger
:map <leader>lp o<Esc>idebugger<Esc>==:w<CR>

" comment line
:map <leader>lk <Esc>0i/*<Esc><S-$><S-a>*/<Esc>:w<CR> 


" translation
" to english
vnoremap <silent><leader>lte :'<,'>TranslateVisual -show-original-phonetics -show-alternatives -show-translation-phonetics -verbose pt:en<CR>
" selection to portuese
vnoremap <silent><leader>ltp :'<,'>TranslateVisual -show-original-phonetics -show-alternatives -show-translation-phonetics -verbose en:pt<CR>

" enable code fold
set foldmethod=manual

" abbr
abbr lenght length
abbr lenhtg length

:map <space>+ :res +5<CR>
:map <space>- :res -5<CR>



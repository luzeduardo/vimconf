" Config
set number
color desert
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
set nrformats+=alpha
set autoindent
set mouse=a

" This check avoids loading plugin when Vim is running on terminal
if has('gui_running')
  silent! call simple_guifont#Set(
    \['JetBrains Mono', 'Hack'], 'Consolas', 16)
endif


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

" NERDTree map {
" aut start nerdtree
" autocmd vimenter * NERDTree

let g:NERDTreeMapOpenInTabSilent = 'T'
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeMouseMode=3

" toggle nerd tree
nmap <leader>m :NERDTreeRefreshRoot %<CR>
nmap <C-b> :NERDTreeToggle<CR>

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

map <leader>p :CtrlP<cr>
map <leader>ol  :CtrlPClearCache<cr>
map <leader>opc :CtrlPCurFile<cr>
map <leader>opb :CtrlPBuffer<cr>
map <leader>opd :CtrlPDir<cr>
map <leader>opl :CtrlPLine<cr>
map <leader>opff :CtrlPChangeAll<cr>
map <leader>opfb :CtrlPChange<cr>

" }

" Fuzzy MRU map {
  map <leader>op :FZFMru<cr>
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
:map <leader>ll yiwo<Esc>iconsole.log('<Esc>p<Esc>a====> <Esc>f)i, <Esc>p<Esc>i<Esc>==:w<Esc>o<Esc><CR>
" debugger
:map <leader>lp o<Esc>idebugger<Esc>==:w<CR>

" comment line
:map <leader>lk <Esc>0i/*<Esc><S-$><S-a>*/<Esc>:w<CR> 
" uncomment line
:map <leader>lku <Esc>0t*<Esc>xx<Esc><S-$>xx<Esc>==_:w<CR>

" ident all the file
:map <leader>i <Esc>ggv<S-g>==<Esc>

" save as root when not root
:map <leader>rr <Esc>:w !sudo tee "%"<CR>

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

:imap ii <Esc>

" coc vim config
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

set hidden

let uname = substitute(system('uname'), '\n', '', '')
" Example values: Linux, Darwin, MINGW64_NT-10.0, MINGW32_NT-6.1
if uname == 'Darwin'
    " do linux/mac command
    let g:LanguageClient_serverCommands = {
                \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
                \ 'javascript': ['/Users/eduardo/.nvm/versions/node/v10.18.1/bin/javascript-typescript-langserver'],
                \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
                \ }
else " windows
    let g:LanguageClient_serverCommands = {
                \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
                \ 'javascript': ['/usr/bin/javascript-typescript-stdio'],
                \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
                \ }
endif

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" search by visual selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>


" Creating a mapping to turn it on and off:
map <leader>l :RainbowLevelsToggle<cr>

" Or automatically turning it on for certain file types:
autocmd Filetype * if index(['javascript', 'python', 'php', 'xml', 'yaml'], &ft) | call rainbow_levels#on() | else | call rainbow_levels#off() | endif


" {{{ netrw
let g:netrw_keepdir=1
" }}}
" Fugitive {{{

nnoremap gst :Gstatus<CR>
nnoremap gdf :Gdiff<CR>
nnoremap gbl :Gblame<CR>
nnoremap gco :Gread<CR>
nnoremap ged :Gedit<CR>
nnoremap gbs :Gbrowse<CR>

" All previous revision of the file
nnoremap gl :Glog<CR>

" All previous commits with the file
nnoremap glg :Glog -- %<CR>

" }}}
" Sessionman {{{

" Autosave session on vim exit, and open last saved session on vim launch with
" no arguments
"set viminfo='100,<50,s10,h,!
"autocmd VimEnter * SessionOpenLast
"let sessionman_save_on_exit = 1

" }}}
" Sy (signify) {{{

let g:signify_realtime = 0
let g:signify_update_on_bufenter = 0
let g:signify_update_on_focusgained = 0
let g:signify_vcs_list = [ 'git' ]
"let g:signify_cursorhold_normal = 1

" }}}
" GitGutter {{{

if &shell ==# "/usr/local/bin/fish"
  set shell=/bin/sh " so it will force fish shell to work with the plugin
endif

" Jump between git diff hunk
"nmap <silent> ]h :<C-U>execute "GitGutterNextHunk"<CR>
"nmap <silent> [h :<C-U>execute "GitGutterPrevHunk"<CR>

" Jump between git diff hunk
nmap <silent> ]h ]c
nmap <silent> [h [c

" }}}
" NERDTree {{{

"nnoremap <leader>n :NERDTreeToggle<cr>
let NERDTreeHijackNetrw=0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" }}}
" NERDTree tabs {{{

nnoremap <leader>n :NERDTreeMirrorToggle<cr>

" }}}
" Tagbar {{{

nmap <leader>r :TagbarToggle<cr>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1

" Tagbar - ruby
let g:tagbar_type_ruby = {
      \ 'kinds' : [
      \ 'm:modules',
      \ 'c:classes',
      \ 'd:describes',
      \ 'C:contexts',
      \ 'f:methods',
      \ 'F:singleton methods'
      \ ]
      \ }

" }}}
" Gundo {{{

nnoremap <leader>u :GundoToggle<CR>

" }}}
" CtrlP {{{

" Make CtrlP use ag command. Way faster and no useless filters
"let g:ctrlp_user_command = 'ag --follow --nogroup --nobreak --noheading --nocolor -a -g "" %s '
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_cmd = 'CtrlP'

" Improve performance
let g:ctrlp_max_depth = 10
let g:ctrlp_lazy_update = 1

" Improve usability
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 'cr'
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 'Et'

" }}}
" ack.vim {{{

"let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
"let g:ackhighlight = 1
"let g:ack_autofold_results = 1
"let g:ack_use_dispatch = 0

" not open first result by default
"cnoreabbrev Ack Ack!
"cnoreabbrev ag Ack!
"cnoreabbrev aG Ack!
"cnoreabbrev Ag Ack!
"cnoreabbrev AG Ack!

" Do a global search for the keyword under the cursor from current directory
" Ack! prevents from jumping to first result when searched
"nnoremap <leader>zz :Ack! <C-r><C-w><CR>
"nnoremap <leader>xx :AckFile! <C-r><C-w><CR>

" }}}
" vim-easytags {{{

nnoremap <leader>g :UpdateTags<CR>

" it is too slow to load
let g:easytags_always_enabled = 0
let g:easytags_python_enabled = 1
let g:easytags_syntax_keyword = 'always'
let g:easytags_async = 1
let g:easytags_file = '~/.vim/tags/tags'
let g:easytags_by_filetype = '~/.vim/tags'
":set tags = ./tags;
"let g:easytags_dynamic_files = 1
let g:easytags_resolve_links = 1
let g:easytags_autorecurse = 1
let g:easytags_on_cursorhold = 0
let g:easytags_events = [] "disable easytag auto update, as ctags will sometimes go crazy

" Tag jumping (it shows all matches)
nnoremap <C-\> g]

" }}}
" TeX-PDF {{{

let g:tex_pdf_map_func_keys = 0
noremap <silent> <leader>y <Esc>:BuildAndViewTexPdf<CR>
inoremap <silent> <leader>y <Esc>:BuildAndViewTexPdf<CR>

" }}}
" Session {{{

let g:session_autoload = 'no'

" }}}
" QFEnter {{{

let g:qfenter_vopen_map = ['<Leader>w']
let g:qfenter_hopen_map = ['<Leader>s']
let g:qfenter_topen_map = ['<Leader><Tab>']

" }}}
" neocomplete.vim {{{

if has('nvim')
  "let g:neocomplete#enable_at_startup = 1
endif

" }}}
" {{{ deoplete.nvim

if has('nvim')
  let g:deoplete#enable_at_startup = 1
endif

"inoremap <silent><expr> <TAB>
"\ pumvisible() ? "\<C-n>" :
"\ <SID>check_back_space() ? "\<TAB>" :
"\ deoplete#mappings#manual_complete()
"function! s:check_back_space() abort "{{{
"let col = col('.') - 1
"return !col || getline('.')[col - 1]  =~ '\s'
"endfunction"}}}

" }}}
" yankrank {{{

"let g:yankring_replace_n_pkey = '<leader>p'
"let g:yankring_replace_n_nkey = '<leader>P'
"let g:yankring_replace_n_pkey = '<m-p>'
"let g:yankring_replace_n_nkey = '<m-n>'

" }}}
" yankstack {{{

"nmap <leader>p <Plug>yankstack_substitute_older_paste
"nmap <leader>P <Plug>yankstack_substitute_newer_paste

" }}}
" vim-polyglot {{{

"let g:polyglot_disabled = ['javascript']

" }}}
" semantic-highlight {{{

"au BufNewFile,BufRead *.js SemanticHighlight

" }}}
" Dragvisuals {{{

" https://github.com/atweiden/vim-dragvisuals
runtime plugin/dragvisuals.vim
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

let g:DVB_TrimWS = 1

" }}}
" minibufexpl {{{

let g:miniBufExplorerAutoStart = 0

" }}}
" incsearch {{{

let g:incsearch#auto_nohlsearch = 1
let g:incsearch#consistent_n_direction = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" }}}
" nextval {{{

nmap <silent> <unique> + <Plug>nextvalInc
nmap <silent> <unique> - <Plug>nextvalDec

" }}}
" vim-rspec {{{

let g:rspec_command = "Dispatch spring rspec {spec}"
let g:rspec_runner = "os_x_iterm"

map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" }}}
" {{{ Itchy

nmap <Leader>ss <Plug>(itchy-open-scratch)

" }}}
" {{{ xmpfilter

nmap <buffer> <leader>z <Plug>(xmpfilter-run)
xmap <buffer> <leader>z <Plug>(xmpfilter-run)
imap <buffer> <leader>z <Plug>(xmpfilter-run)
nmap <buffer> <leader>m <Plug>(xmpfilter-mark)
xmap <buffer> <leader>m <Plug>(xmpfilter-mark)
imap <buffer> <leader>m <Plug>(xmpfilter-mark)

" }}}
" {{{ stylus

autocmd BufNewFile,BufReadPost *.styl set filetype=stylus

" }}}
" {{{ jsx

let g:jsx_ext_required = 0

" }}}
" {{{ easy-align

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}
" {{{ Fixmyjs

let g:fixmyjs_use_local = 1

"au BufWritePre *.js :Fixmyjs
"au BufWritePre *.jsx :Fixmyjs
noremap <F3> :Fixmyjs<CR>

" }}}
" {{{ fzf
" Set ENV to use rg instead (should be faster and better)
" export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,.svn,node_modules,bower_components}"'

noremap <C-p> :Files<CR>
" }}}
" {{{ CtrlF
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
" }}}
" {{{ Far.vim

"if has('nvim')
  "let g:far#source='agnvim'
"else
  let g:far#source='ag'
"endif

let g:far#auto_preview=0
let g:far#collapse_result=1
"let g:far#default_mappings=0

nnoremap <leader>zz :F <C-r><C-w> .<CR>

" }}}
" {{{ LargeFile

" file is large from 1mb, disable colorscheme and among other stuff to speed
" things up
" http://www.vim.org/scripts/script.php?script_id=1506
let g:LargeFile = 1

" }}}
" {{{ Xuyuanp/nerdtree-git-plugin

let g:NERDTreeShowIgnoredStatus = 0

" }}}
" {{{ WindowSwap

" move window to absolute top, left, right, or bottom
nnoremap <C-J> <C-W>J
nnoremap <C-K> <C-W>K
nnoremap <C-L> <C-W>L
nnoremap <C-H> <C-W>H

let g:windowswap_map_keys = 0 "prevent default bindings
nmap J :call WindowSwap#EasyWindowSwap()<CR><C-j>:call WindowSwap#EasyWindowSwap()<CR>
nmap K :call WindowSwap#EasyWindowSwap()<CR><C-k>:call WindowSwap#EasyWindowSwap()<CR>
nmap L :call WindowSwap#EasyWindowSwap()<CR><C-l>:call WindowSwap#EasyWindowSwap()<CR>
nmap H :call WindowSwap#EasyWindowSwap()<CR><C-h>:call WindowSwap#EasyWindowSwap()<CR>

" }}}
" {{{ startify

let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [ {'x': '~/.vimrc'}, {'z': '~/.zshrc'} ]
let g:startify_commands = [ {'m': 'edit .'} ]

" }}}
" {{{ vim-multiple-cursors

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  "exe 'YRToggle 0'
  if has('nvim')
    call deoplete#disable()
  else
    "exe 'NeoCompleteDisable'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  "exe 'YRToggle 1'
  if has('nvim')
    call deoplete#enable()
  else
    "exe 'NeoCompleteEnable'
  endif
endfunction

set t_BE=

" }}}
" {{{ tagbar

nmap <F8> :TagbarToggle<CR>

" }}}
" {{{ vim-airline
" https://github.com/vim-airline/vim-airline/wiki/Screenshots

let g:airline_highlighting_cache=1
"let g:airline_theme='luna'
let g:airline_theme = 'wombat'
"let g:airline_theme = 'dark'
"let g:airline_theme = 'murmur'
"let g:airline_theme='one'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tmuxline#enabled = 0 "so it doens't overwrite tmux settings


" }}}
" {{{ RainbowParethesis

"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" }}}

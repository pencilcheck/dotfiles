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

let g:signify_vcs_list = [ 'git' ]
"let g:signify_update_on_focusgained = 1
"let g:signify_cursorhold_normal = 1

" Jump between git diff hunk
nmap <silent> ]h ]c
nmap <silent> [h [c

" }}}
" GitGutter {{{

" Jump between git diff hunk
"nmap <silent> ]h :<C-U>execute "GitGutterNextHunk"<CR>
"nmap <silent> [h :<C-U>execute "GitGutterPrevHunk"<CR>

" }}}
" NERDTree {{{

"nnoremap <leader>n :NERDTreeToggle<cr>

" }}}
" NERDTree tabs {{{

nnoremap <leader>n :NERDTreeTabsToggle<cr>
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0

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

let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
let g:ackhighlight = 1
let g:ack_autofold_results = 1
let g:ack_use_dispatch = 0

" not open first result by default
cnoreabbrev Ack Ack!
cnoreabbrev ag Ack!
cnoreabbrev aG Ack!
cnoreabbrev Ag Ack!
cnoreabbrev AG Ack!

" Do a global search for the keyword under the cursor from current directory
" Ack! prevents from jumping to first result when searched
"nnoremap <leader>zz :Ack! <C-r><C-w><CR>
nnoremap <leader>zz :F <C-r><C-w> .<CR>
nnoremap <leader>xx :AckFile! <C-r><C-w><CR>

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
" Neocomplcache {{{

"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" }}}
" Bufferline {{{

let g:bufferline_rotate = 1
" Statusline integration
let g:bufferline_echo = 0
autocmd VimEnter *
      \ let &statusline='%{bufferline#refresh_status()}'
      \ .bufferline#get_status_string()

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

let g:neocomplete#enable_at_startup = 1

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
" YankRing {{{

let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
" ,y to show the yankring
nmap <leader>y :YRShow<cr>
let g:yankring_history_dir = '$VIM'

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
set rtp+=/usr/local/opt/fzf
noremap <C-p> :FZF<CR>
" }}}
" {{{ Far.vim

let g:far#source='ag'

" }}}
" {{{ deoplete.nvim

call deoplete#enable()
let g:deoplete#enable_at_startup = 1

" }}}
" {{{ LargeFile

" file is large from 1mb, disable colorscheme and among other stuff to speed
" things up
" http://www.vim.org/scripts/script.php?script_id=1506
let g:LargeFile = 1

" }}}

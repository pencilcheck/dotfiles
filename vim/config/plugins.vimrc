" {{{ netrw
let g:netrw_keepdir=1
" }}}
" Fugitive {{{

" basically opens a terminal and use it to run command (sometimes commit will
" use hooks and mess up everything in nvim
nnoremap gci :FloatermNew
"nnoremap gst :FloatermNew nvim -c ":Git" +only
nnoremap gst :FloatermNew nvim % -c ":Git" +only
"nnoremap gst :Git<CR>
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

"nnoremap <leader>n :NERDTreeMirrorToggle<cr>

" }}}
" Nvim tree {{{

nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>m :NvimTreeFindFile<CR>

lua << EOF
  require'nvim-tree'.setup {
    disable_netrw       = false,
    hijack_netrw        = false,
    open_on_setup       = true,
    ignore_ft_on_setup  = {},
    auto_close          = false,
    open_on_tab         = true,
    hijack_cursor       = false,
    update_cwd          = false,
    update_to_buf_dir   = {
      enable = true,
      auto_open = true,
    },
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    update_focused_file = {
      enable      = true,
      update_cwd  = true,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    filters = {
      dotfiles = false,
      custom = {}
    },
    view = {
      width = 30,
      height = 30,
      hide_root_folder = false,
      side = 'left',
      auto_resize = false,
      mappings = {
        custom_only = false,
        list = {}
      }
    }
  }
EOF
let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_gitignore = 0 "0 by default
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_group_empty = 0 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile


"Default actions

"move around like in any vim buffer
"<CR> or o on .. will cd in the above directory
"<C-]> will cd in the directory under the cursor
"<BS> will close current opened directory or parent
"type a to add a file. Adding a directory requires leaving a leading / at the end of the path.
"you can add multiple directories by doing foo/bar/baz/f and it will add foo bar and baz directories and f as a file
"type r to rename a file
"type <C-r> to rename a file and omit the filename on input
"type x to add/remove file/directory to cut clipboard
"type c to add/remove file/directory to copy clipboard
"type p to paste from clipboard. Cut clipboard has precedence over copy (will prompt for confirmation)
"type d to delete a file (will prompt for confirmation)
"type ]c to go to next git item
"type [c to go to prev git item
"type - to navigate up to the parent directory of the current file/directory
"if the file is a directory, <CR> will open the directory otherwise it will open the file in the buffer near the tree
"if the file is a symlink, <CR> will follow the symlink (if the target is a file)
"<C-v> will open the file in a vertical split
"<C-x> will open the file in a horizontal split
"<C-t> will open the file in a new tab
"<Tab> will open the file as a preview (keeps the cursor in the tree)
"I will toggle visibility of folders hidden via |g:nvim_tree_ignore|
"H will toggle visibility of dotfiles (files/folders starting with a .)
"R will refresh the tree
"Double left click acts like <CR>
"Double right click acts like <C-]>



" }}}
" Minimap {{{

let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
let g:minimap_git_colors = 1
let g:minimap_highlight_range = 1

" }}}
" indentLine {{{

let g:indentLine_enabled = 1
let g:indent_blankline_char_highlight_list = ['Error', 'Function']
let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']
let g:indent_blankline_show_trailing_blankline_indent = v:false
let g:indent_blankline_filetype_exclude = [ 'fugitive', 'nerdtree', 'tagbar', 'help', 'startify', 'netrw', 'vim-plug' ]
let g:indent_blankline_buftype_exclude = [ 'nofile', 'nowrite', 'quickfix', 'terminal', 'prompt' ]

" }}}
" Barbar {{{

let s:patterns = {}

" 6 hex-numbers, optionnal #-prefix
let s:patterns['hex']      = '\v#?(\x{2})(\x{2})(\x{2})'

" short version is strict: starting # mandatory
let s:patterns['shortHex'] = '\v#(\x{1})(\x{1})(\x{1})'

function! s:interpolate (start, end, amount)
    let diff = a:end - a:start
    return a:start + (diff * a:amount)
endfunc

" @params (r, g, b)
" @params ([r, g, b])
" @returns String           A RGB color
fu! s:pluginsRGBtoHex (...)
    let [r, g, b] = ( a:0==1 ? a:1 : a:000 )
    let num = printf('%02x', float2nr(r)) . ''
          \ . printf('%02x', float2nr(g)) . ''
          \ . printf('%02x', float2nr(b)) . ''
    return '#' . num
endfu

" @param {String|Number} color   The color to parse
fu! s:pluginsHexToRGB (color)
    if type(a:color) == 2
        let color = printf('%x', a:color)
    else
        let color = a:color | end

    let matches = matchlist(color, s:patterns['hex'])
    let factor  = 0x1

    if empty(matches)
        let matches = matchlist(color, s:patterns['shortHex'])
        let factor  = 0x10
    end

    if len(matches) < 4
        throw 'Couldnt parse ' . string(color) . ' ' .  string(matches)
    end

    let r = str2nr(matches[1], 16) * factor
    let g = str2nr(matches[2], 16) * factor
    let b = str2nr(matches[3], 16) * factor

    return [r, g, b]
endfu

" @params String                 color      The color
" @params {Number|String|Float} [amount=5]  The percentage of light
fu! s:pluginsLighten(color, ...)
    let amount = a:0 ?
                \(type(a:1) < 2 ?
                    \str2float(a:1) : a:1 )
                \: 5.0

    if(amount < 1.0)
        let amount = 1.0 + amount
    else
        let amount = 1.0 + (amount / 100.0)
    end

    let rgb = s:pluginsHexToRGB(a:color)
    let rgb = map(rgb, 'v:val * amount')
    let rgb = map(rgb, 'v:val > 255.0 ? 255.0 : v:val')
    let rgb = map(rgb, 'float2nr(v:val)')
    let hex = s:pluginsRGBtoHex(rgb)
    return hex
endfu

function! s:pluginsMix (a, b, ...)
    let amount = a:0 ? a:1 : 0.5

    let ca = s:pluginsHexToRGB(a:a)
    let cb = s:pluginsHexToRGB(a:b)

    let r = s:interpolate(ca[0], cb[0], amount)
    let g = s:interpolate(ca[1], cb[1], amount)
    let b = s:interpolate(ca[2], cb[2], amount)

    return s:pluginsRGBtoHex([r, g, b])
endfunc

function! s:_ (name, ...)
  let fg = ''
  let bg = ''
  let attr = ''

  if type(a:1) == 3
    let fg   = get(a:1, 0, '')
    let bg   = get(a:1, 1, '')
    let attr = get(a:1, 2, '')
  else
    let fg   = get(a:000, 0, '')
    let bg   = get(a:000, 1, '')
    let attr = get(a:000, 2, '')
  end

  let has_props = v:false

  let cmd = 'hi! ' . a:name
  if !empty(fg) && fg != 'none'
    let cmd .= ' guifg=' . fg
    let has_props = v:true
  end
  if !empty(bg) && bg != 'none'
    let cmd .= ' guibg=' . bg
    let has_props = v:true
  end
  if !empty(attr) && attr != 'none'
    let cmd .= ' gui=' . attr
    let has_props = v:true
  end
  execute 'hi! clear ' a:name
  if has_props
    execute cmd
  end
endfunc

let s:base0      = '#1B2229'
let s:base1      = '#1c1f24'
let s:base2      = '#202328'
let s:base3      = '#23272e'
let s:base4      = '#3f444a'
let s:base5      = '#5B6268'
let s:base6      = '#73797e'
let s:base7      = '#9ca0a4'
let s:base8      = '#b1b1b1'
let s:base9      = '#E6E6E6'

let s:grey       = s:base4
let s:red        = '#ff6c6b'
let s:orange     = '#da8548'
let s:green      = '#98be65'
let s:teal       = '#4db5bd'
let s:yellow     = '#ECBE7B'
let s:blue       = '#51afef'
let s:dark_blue  = '#2257A0'
let s:magenta    = '#c678dd'
let s:violet     = '#a9a1e1'
let s:cyan       = '#46D9FF'
let s:dark_cyan  = '#5699AF'
let s:white      = '#efefef'

let s:green_alt  = '#799033'

let s:bg             = '#282c34'
let s:bg_alt         = '#21242b'
let s:bg_highlight   = '#2E323C'
let s:bg_popup       = '#3E4556'
let s:bg_widget      = s:bg
let s:bg_statusline  = s:bg_popup
let s:bg_visual      = s:pluginsLighten(s:base4, 0.3)
let s:bg_selection   = s:dark_blue
let s:bg_highlighted = '#4A4A45'

let s:fg           = '#bbc2cf'
let s:fg_alt       = '#5B6268'
let s:fg_widget    = s:fg
let s:fg_conceal   = s:base4
let s:fg_subtle    = s:base7
let s:fg_highlight = s:pluginsLighten(s:fg, 0.2)
let s:fg_linenr    = s:base4


let s:highlight       = s:blue
let s:highlight_color = s:base0

let s:tag    = s:pluginsMix(s:blue, s:cyan)

let s:diff_info_fg  = s:blue
let s:diff_info_bg0 = s:pluginsMix('#D8EEFD', s:bg, 0.6)
let s:diff_info_bg1 = s:pluginsMix('#D8EEFD', s:bg, 0.8)

let s:diff_add_fg  = s:green
let s:diff_add_fg0 = s:pluginsMix(s:green,   s:fg, 0.4)
let s:diff_add_bg0 = s:pluginsMix('#506d5b', s:bg, 0.4)
let s:diff_add_bg1 = s:pluginsMix('#acf2bd', s:bg, 0.6)
let s:diff_add_bg2 = s:pluginsMix('#acf2bd', s:bg, 0.8)

let s:gh_danger_fg  = s:red
let s:gh_danger_fg0 = s:pluginsMix(s:red,     s:fg, 0.6)
let s:gh_danger_bg0 = s:pluginsMix('#ffdce0', s:bg, 0.6)
let s:gh_danger_bg1 = s:pluginsMix('#ffdce0', s:bg, 0.8)
let s:gh_danger_bg2 = s:pluginsMix('#ffdce0', s:bg, 0.9)

let s:bg_current = s:bg
let s:bg_visible = s:bg
let s:bg_other   = s:base1

call s:_('BufferCurrent',       s:base9,          s:bg_current,  'none')
call s:_('BufferCurrentIndex',  s:base6,          s:bg_current,  'none')
call s:_('BufferCurrentMod',    s:yellow,         s:bg_current,  'none')
call s:_('BufferCurrentSign',   s:blue,           s:bg_current,  'none')
call s:_('BufferCurrentTarget', s:red,            s:bg_current,  'bold')

call s:_('BufferVisible',       s:base7,          s:bg_visible,  'none')
call s:_('BufferVisibleIndex',  s:base9,          s:bg_visible,  'none')
call s:_('BufferVisibleMod',    s:yellow,         s:bg_visible,  'none')
call s:_('BufferVisibleSign',   s:base4,          s:bg_visible,  'none')
call s:_('BufferVisibleTarget', s:red,            s:bg_visible,  'bold')

call s:_('BufferInactive',       s:base6,          s:bg_other,    'none')
call s:_('BufferInactiveIndex',  s:base6,          s:bg_other,    'none')
call s:_('BufferInactiveMod',    s:yellow,         s:bg_other,    'none')
call s:_('BufferInactiveSign',   s:base4,          s:bg_other,    'none')
call s:_('BufferInactiveTarget', s:red,            s:bg_other,    'bold')

nnoremap <silent>     <A-c> :BufferClose<CR>
nnoremap <silent>     <A-s> :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>

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

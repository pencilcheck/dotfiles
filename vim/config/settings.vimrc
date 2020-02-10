
" Settings
" {{{ Encoding
set encoding=UTF-8
" }}}
" {{{ Ungrouped settings

set nocompatible
filetype plugin indent on

if &t_Co > 2 || has("gui_running")
  syntax on
endif

set wildignore+=*.o,*.obj,.git,.svn,*.pyc,*/log/*,*/apidocs/*,*/tmp/*,*.so,*.swp,*.zip,*.class,*.log,*/coverage/*
set fileencodings=utf-8,big5,euc-jp,euc-kr,gbk,utf-bom,iso8859-1,latin1

set modelines=2

set splitbelow
set splitright

set showmatch "useful to show matched parenthesis
set matchtime=3

set fdm=marker
highlight Folded guibg=grey guifg=blue

set encoding=utf-8
set scrolloff=10
"set scrolljump=5
set showmode
set showcmd
set ruler
set lazyredraw
set hidden
set title
set wildmenu
set wildmode=list:longest,full
set visualbell
set noerrorbells
set nocursorline
set ttyfast
set ft=sh
set backspace=indent,eol,start
set laststatus=2
set number

set pastetoggle=<F2>

set mouse=a "for scrolling

set regexpengine=1

" stop auto comment
" http://tilvim.com/2013/05/29/comment-prefix.html
set formatoptions-=or

" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus
"set clipboard=unnamed

"nnoremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
set infercase
"set gdefault
set nohlsearch
set incsearch
set showmatch
set hlsearch

set nowrapscan " don't wrap when search
"set wrap
"set linebreak
"set textwidth=80
set formatoptions=tqrn1

" For ColorColumn
set colorcolumn=100

" Live substitution (neovim)
if exists('&inccommand')
  set inccommand=split
endif

" Instead of showing for all columns, only highlight lines that go over
"highlight ColorColumn ctermbg=red
"call matchadd('ColorColumn', '\%81v', 100)

" }}}
" {{{ Enable 24bit true color support

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  "set termguicolors
endif

" Set Vim-specific sequences for RGB colors
" https://github.com/vim/vim/issues/993
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" }}}
" Colorscheme/Syntax {{{

" true color
if (has("termguicolors"))
  "set background=dark " for the dark version
  "set background=light " for the light version
  "let g:one_allow_italics = 1 " I love italic for comments
  "colorscheme one
endif

" 256 color
if &t_Co >= 256
  "colorscheme gruvbox
  "colorscheme disco
  "colorscheme lettuce
  "colorscheme inkpot
  "colorscheme gentooish
  "colorscheme heroku-terminal
  "colorscheme seoul256
  "colorscheme seoul256-light
  colorscheme dracula
  "colorscheme wombat
  "colorscheme wombat256mod
  "colorscheme molokai
  "colorscheme zenburn
  "colorscheme railscasts
  "colorscheme sexy-railscasts-256
  "colorscheme solarized
endif

" gui
if has("gui_running")
  "colorscheme zenburn
  "colorscheme seoul256
  colorscheme seoul256-light
  "colorscheme dracula
  "colorscheme heroku
  "colorscheme github
  "colorscheme railscasts
endif

" }}}
" {{{ Font and ligature

if has('gui_running')
  set macligatures
endif

" font configuration
if has('gui_running')
  " powerline arrow aligned (for Terminal.app > 18pt), almost full powerline charset (missing ===), ligature is not showing up in Macvim
  " https://github.com/be5invis/Iosevka/issues/56
  "set guifont=Iosevka:h18
  "set guifont=IosevkaNerdFontC-Light:h16

  "set guifont=KnackNerdFontC-Regular:h18

  " powerline arrow aligned, full powerline charset, no ligature support in Macvim
  "set guifont=Fantasque\ Sans\ Mono:h18 

  " powerline arrow not aligned, full powerline charset, full ligature support in Macvim
  set guifont=Fira\ Code\ Retina:h14

  " powerline arrow aligned, partial powerline charset, partial ligature support in Macvim
  " (missing <= for instance)
  "set guifont=Hasklig:h18

  " powerline arrow almost aligned, full powerline charset, no ligature support in Macvim
  "set guifont=Hack:h14

  " powerline arrow not aligned, partial powerline charset, full ligature support in Macvim
  "set guifont=Monoid\ Retina:h18

  "set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12
  "set guifont=Menlo\ for\ Powerline:h12
  "set guifont=Monaco\ for\ Powerline:h11
  "set guifont=PragmataPro\ for\ Powerline:h18
  "set guifont=Inconsolata\ for\ Powerline:h14
endif

" }}}
" {{{ Speed up visual mode

"set timeout timeoutlen=200 ttimeoutlen=100
" http://stackoverflow.com/questions/15550100/exit-visual-mode-without-delay
set timeoutlen=300 ttimeoutlen=0
set updatetime=100

" }}}
" {{{ Show invisible characters

set list
set listchars=tab:▸\ ,eol:¬,trail:.,extends:#,nbsp:.

" }}}
" {{{ Undo history

set history=1000 "remembers more commands and search history
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set noswapfile
" }}}
" {{{ Tab setup

set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set smarttab

" }}}
" {{{ Indentation

set autoindent
set copyindent
set smartindent
"set cindent

" }}}
" {{{ Per project .vimrc

set exrc
set secure

" }}}
" {{{ Remove the need for a backup file before edit but keep the swap file for edit history

" https://stackoverflow.com/a/607475/1742820
set nobackup
set nowritebackup " write directly to original file instead of the original vim behavior

" please, no tmp or swap files scattered across my folders, so messy
" need to create the directory or those will not work
set backupdir=~/.vimtmp,.
set directory=~/.vimtmp,.

" }}}
" {{{ Statusline

set laststatus=2
set statusline=%f "tail of the filename
hi StatusLine ctermfg=86 ctermbg=117 guifg=#2c323c guibg=#87d7ff
hi StatusLineNC ctermfg=86 ctermbg=145 guifg=#2c323c guibg=#abb2bf

"hi StatusLine ctermfg=86 ctermbg=145 guifg=#2c323c guibg=#abb2bf
"hi StatusLineNC ctermfg=86 ctermbg=145 guifg=#2c323c guibg=#abb2bf

" }}}

" Autocmd
" Matching brackets/parenthesis {{{

hi MatchParen term=underline cterm=underline ctermfg=147 ctermbg=235 gui=underline guifg=#80a0ff guibg=bg

" }}}
" Jumps to last known position {{{

" just after opening it, if the '"' mark is set:"
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" }}}
" Cursor highlight {{{

" Only highlight current line number instead of the whole line
hi clear CursorLine
augroup CLClear
  autocmd! ColorScheme * hi clear CursorLine
augroup END

hi CursorLineNR cterm=bold
augroup CLNRSet
  autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END

" }}}
" {{{ Clear syntax for a large file with a very long first line

"autocmd BufWinEnter * if line2byte(line("$") + 1) > 10000000 | syntax clear | endif

augroup LargeFile
        let g:large_file = 209715200 " 200MB

        " Set options:
        "   eventignore+=FileType (no syntax highlighting etc
        "   assumes FileType always on)
        "   noswapfile (save copy of file)
        "   bufhidden=unload (save memory when other file is viewed)
        "   buftype=nowrite (is read-only) - disable this for now as usually I want edit
        "   undolevels=-1 (no undo possible)
        au BufReadPre *
                \ let f=expand("<afile>") |
                \ if getfsize(f) > g:large_file |
                        \ setlocal eventignore+=FileType |
                        \ setlocal noswapfile bufhidden=unload undolevels=-1 |
                        "\ setlocal buftype=nowrite |
                \ else |
                        \ setlocal eventignore-=FileType |
                \ endif
augroup END

" }}}
" Custom file syntax highlighting {{{

"enable prawn files syntax highlight
au BufNewFile,BufRead *.prawn set filetype=ruby

"enable skim files syntax highlight
au BufNewFile,BufRead *.skim set filetype=slim

"enable ng-classify files syntax highlight
au BufNewFile,BufRead *.ng-classify set filetype=coffee

" }}}
" {{{ TODO

command Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw

" }}}

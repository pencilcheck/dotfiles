call plug#begin('~/.vim/bundle')

" Editing
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'tpope/vim-repeat' " enable repeating supported plugin
Plug 'tpope/vim-abolish' " easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-unimpaired' " pairs of handy bracket mappings
Plug 'scrooloose/nerdcommenter' " vim plugin for intensely nerdy commenting powers
Plug 'gorkunov/smartpairs.vim' " enchanted visual (selection) mode for Vim (vvvvvv to select)
Plug 'terryma/vim-multiple-cursors' " true Sublime Text style multiple selections for Vim
Plug 'vim-scripts/nextval' " inc-/decrement the current value (bool, int, numeric, hex) with one keystroke
Plug 'tommcdo/vim-exchange' " easy text exchange operator for Vim.
Plug 'junegunn/vim-easy-align' " a Vim alignment plugin
Plug 'idbrii/vim-focusclip' " a proper integration for clipboard
Plug 'andymass/vim-matchup' " matchit enhanced

" Search
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine for vim8 & neovim, full language server protocol support as VSCode
Plug 'dyng/ctrlsf.vim' " an ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'haya14busa/incsearch.vim' " improved incremental searching for Vim
Plug 'brooth/far.vim' " find and replace Vim plugin

" Git
Plug 'tpope/vim-fugitive' " a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-rhubarb' " GitHub extension for fugitive.vim
Plug 'airblade/vim-gitgutter' " a Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks and partial hunks. can <leader>hs to stage hunks
Plug 'sindrets/diffview.nvim' " see all git diff in one window

" IDE functionality
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'wfxr/minimap.vim'
Plug 'folke/lsp-colors.nvim' " more like a patch, not end user
Plug 'neovim/nvim-lspconfig' " lsp core functionality
"Plug 'Yggdroot/indentLine' " add indent lines, obsolete
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' } " better version of indent lines
Plug 'romgrk/barbar.nvim' " manage buffer like a boss with new keybindings
Plug 'voldikss/vim-floaterm'

" Language syntax highlights
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'othree/javascript-libraries-syntax.vim' " for javascript
"Plug 'othree/yajs.vim'
"Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'vue', 'vue.html.javascript.css'] }
"Plug 'herringtondarkholme/yats.vim'
"Plug 'MaxMEllon/vim-jsx-pretty'
"Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'

" File navigation
Plug 'tpope/vim-vinegar' " combine with netrw to create a delicious salad dressing
Plug 'mhinz/vim-startify' " the fancy start screen for Vim
"Plug 'scrooloose/nerdtree' " a tree explorer plugin for vim.
"Plug 'jistr/vim-nerdtree-tabs' " NERDTree and tabs together in Vim, painlessly
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Layout
Plug 'wesQ3/vim-windowswap' " swap your windows without ruining your layout

" IntelliJ
"Plug 'beeender/Comrade'

" Tmux
Plug 'christoomey/vim-tmux-navigator' " seamless navigation between tmux panes and vim splits
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux-focus-events'

" CSS
Plug 'rstacruz/vim-hyperstyle' " write CSS faster. Type faster by shorthand that will auto-expand as you type

" Ruby
Plug 'tpope/vim-endwise' " add 'end' in ruby, endfunction/endif/more in vim script, etc

" Javascript/Typescript
Plug 'ruanyl/vim-fixmyjs' " vim fixmyjs - auto fix your javascript using fixmyjs/eslint/tslint/jscs
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Eye candy
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer' " a Vim plugin to colorize all text in the form #rrggbb or #rgb.
Plug 'ap/vim-css-color' " preview colours in source code while editing
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'jszakmeister/vim-togglecursor' " toggle the cursor shape in the terminal for Vim.

" Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'jsit/disco.vim'
Plug 'rakr/vim-one'
Plug 'kristiandupont/shades-of-teal'
Plug 'vim-scripts/lettuce.vim'
Plug 'vim-scripts/inkpot'
Plug 'vim-scripts/Gentooish'
Plug 'stulzer/heroku-colorscheme'
Plug 'chankaward/vim-railscasts-theme'
Plug 'junegunn/seoul256.vim'
Plug 'michalbachowski/vim-wombat256mod'
Plug 'tomasr/molokai'
Plug 'davidkariuki/sexy-railscasts-256-theme'
Plug 'endel/vim-github-colorscheme'
Plug 'folke/tokyonight.nvim'

" Clojure
"Plug 'guns/vim-clojure-static'
"Plug 'kien/rainbow_parentheses.vim'
"Plug 'tpope/vim-fireplace'

" Other plugins
"Plug 'majutsushi/tagbar'
"Plug 'tpope/vim-rake'
"Plug 'tpope/vim-rails'
"Plug 'tpope/vim-bundler'
"Plug 'tpope/vim-obsession'
"Plug 't9md/vim-ruby-xmpfilter' "https://github.com/JoshCheek/seeing_is_believing
"Plug 'ecomba/vim-ruby-refactoring'
"Plug 'kien/ctrlp.vim'
"Plug 'junegunn/vim-pseudocl'
"Plug 'junegunn/vim-oblique'
"Plug 'gelguy/snapshot.vim'
"Plug 'TeX-PDF'
"Plug 'tpope/vim-bundler'
"Plug 'tpope/vim-rake'
"Plug 'tpope/vim-eunuch'
"Plug 'lukaszb/vim-web-indent'
"Plug 'AndrewRadev/undoquit.vim'
"Plug 'sessionman.vim'
"Plug 'kana/vim-textobj-user'
"Plug 'dkprice/vim-easygrep'
"Plug 'xolox/vim-session'
"Plug 'yonchu/accelerated-smooth-scroll'
"Plug 'joshdick/onedark.vim'
"Plug 'jelera/vim-javascript-syntax'
"Plug 'jparise/vim-graphql'
"Plug 'elzr/vim-json'
"Plug 'mtscout6/vim-cjsx'
"Plug 'lambdatoast/elm.vim'
"Plug 'tpope/vim-haml'
"Plug 'kchmck/vim-coffee-script'
"Plug 'slim-template/vim-slim'
"Plug 'puppetlabs/puppet-syntax-vim'
"Plug 'tpope/vim-markdown'
"Plug 'wavded/vim-stylus'
"Plug 'kylef/apiblueprint.vim'
"Plug 'gkz/vim-ls'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'majutsushi/tagbar'
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
"Plug 'Xuyuanp/nerdtree-git-plugin' " it kinda slow down the scrolling when nerdtree is opened with this plugin
"Plug 'yssl/QFEnter'
"Plug 'vim-scripts/BufOnly.vim'
"Plug 'mattn/gist-vim'
"Plug 'thoughtbot/vim-rspec'
"Plug 'xolox/vim-reload'
"Plug 'Lokaltog/vim-easymotion'
"Plug 'sjl/gundo.vim'
"Plug 'techlivezheng/vim-plugin-minibufexpl'
"Plug 'osyo-manga/vim-over'
"Plug 'vim-scripts/cecutil'
"Plug 'vim-scripts/vis'
"Plug 'atweiden/vim-dragvisuals'
"Plug 'scrooloose/syntastic'
"Plug 'caigithub/a_pair'
"Plug 'kana/vim-textobj-user'
"Plug 'nelstrom/vim-textobj-rubyblock' " depends on kana/vim-textobj-user
"Plug 'vim-ruby/vim-ruby'
"Plug 'AndrewRadev/splitjoin.vim'
"Plug 'AndrewRadev/switch.vim'
"Plug 'idbrii/itchy.vim'
"Plug 'idbrii/vim-ripple'
"Plug 'mhinz/vim-hugefile'
"Plug 'mhinz/vim-signify'
"Plug 'metakirby5/codi.vim'

" Blacklisted
"Plug 'vim-scripts/YankRing.vim'
"Plug 'fleischie/vim-styled-components'
"Plug 'tpope/vim-speeddating'
"Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-abolish'
"Plug 'Raimondi/delimitMate'
"Plug 'ton/vim-bufsurf'
"Plug 'Lokaltog/powerline'
"Plug 'Valloric/YouCompleteMe'
"Plug 'sheerun/vim-polyglot' " a solid language pack for Vim.
"Plug 'jaxbot/semantic-highlight.vim'

call plug#end()

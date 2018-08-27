" improve esc key
inoremap <Esc> <Esc>`^

" remap <leader> key to ,
let mapleader=","

" Split buffers into windows
map <leader>bs :tab sball<CR>

" Buffer movements
nnoremap <leader>d :bd<CR>
" vim-unimpaired has bindings for those
"nnoremap [ :bp<CR>
"nnoremap ] :bn<CR>
nnoremap <leader>1 :1b<CR>
nnoremap <leader>2 :2b<CR>
nnoremap <leader>3 :3b<CR>
nnoremap <leader>4 :4b<CR>
nnoremap <leader>5 :5b<CR>
nnoremap <leader>6 :6b<CR>
nnoremap <leader>7 :7b<CR>
nnoremap <leader>8 :8b<CR>
nnoremap <leader>9 :9b<CR>
nnoremap <leader>0 :10b<CR>

" Visual paste fix
" http://superuser.com/questions/321547/how-do-i-replace-paste-yanked-text-in-vim-without-yanking-the-deleted-lines
"vnoremap p "_dP

" Key bindings
noremap <F1> <ESC>

" Disable q and Q
"map q <Nop>
map Q <Nop>

" too lazy to type :
nnoremap ; :

" Use tab for indenting in visual mode
vnoremap <Tab> >gv|
vnoremap <S-Tab> <gv
nnoremap > >>_
nnoremap < <<_

"vnoremap <Tab> >gv
"vnoremap <S-Tab> <gv

" Map folding to Spacebar
nnoremap <Space> za

nnoremap <silent> <leader><Space> :nohl<CR>

" Jumps to next row in long wrapped lines
nnoremap j gj
nnoremap k gk

" Front and back of the line
nnoremap B ^
nnoremap E $

nnoremap <leader>v <C-w>v<C-w>h
nnoremap <leader>s <C-w>s<C-w>k
nnoremap <leader>x :vsplit $MYVIMRC<cr><C-w>L<cr>
nnoremap <leader>q :copen<cr>
"nnoremap <leader>v <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Open NERDTree in the split explorer in the current buffer
nnoremap <leader>m :e.<cr>

" Split selected text into lines (use S instead of J which is join)
vnoremap S :s/ /\r/g<cr>


" Vundle shortkeys (already setup cli shortkey for PluginInstall
"nnoremap <leader>b :PluginInstall<cr>
"nnoremap <leader>c :PluginClean<cr>

" Let you edit sudo files after opening it
cmap w!! w !sudo tee % >/dev/null

" Search for visually selected text
" Search for selected text, forwards or backwards.
vnoremap <silent> gd :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy/<C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> gD :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy?<C-R><C-R>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>

" Resize windows (key bindings only work in iterms where meta key is set to +esc) {{{

set winminwidth=0
set winminheight=0

function! VimNavigate(direction)
  execute 'wincmd ' . a:direction
endfunction

function! VimRestore(nr)
  execute a:nr . "wincmd w"
endfunction

function! DetermineLocation()
  let nr = winnr()
  let locations = []
  call VimNavigate('h')
  if (nr ==? winnr())
    call add(locations, 'left')
  else
    call VimRestore(nr)
  endif

  call VimNavigate('l')
  if (nr ==? winnr())
    call add(locations, 'right')
  else
    call VimRestore(nr)
  end

  call VimNavigate('k')
  if (nr ==? winnr())
    call add(locations, 'top')
  else
    call VimRestore(nr)
  endif

  call VimNavigate('j')
  if (nr ==? winnr())
    call add(locations, 'bottom')
  else
    call VimRestore(nr)
  endif

  return locations
endfunction

function! MyResize(dir)
  let location_right = 0
  let location_left = 0
  let location_top = 0
  let location_bottom = 0
  let locations = DetermineLocation()
  for location in locations
    if (location ==? 'right')
      let location_right = 1
    elseif (location ==? 'left')
      let location_left = 1
    elseif (location ==? 'top')
      let location_top = 1
    elseif (location ==? 'bottom')
      let location_bottom = 1
    endif
  endfor

  let prefix = "normal 5\<c-w>"
  let cmd = ''

  if ('=' ==# a:dir)
    let prefix = "normal \<c-w>"
    let cmd = "="
  endif

  if ('h' ==# a:dir)
    if (location_right == 1)
      let cmd = ">"
    else
      let cmd = "<"
    endif
  endif

  if ('l' ==# a:dir)
    if (location_right == 1)
      let cmd = "<"
    else
      let cmd = ">"
    endif
  endif

  if ('k' ==# a:dir)
    if (location_bottom == 1)
      let cmd = "+"
    else
      let cmd = "-"
    endif
  endif

  if ('j' ==# a:dir)
    if (location_bottom == 1)
      let cmd = "-"
    else
      let cmd = "+"
    endif
  endif

  " Only one window, pointless to resize
  if (location_right == 1 && location_left == 1 && location_top == 1 && location_bottom == 1)
    let prefix = ''
    let cmd = ''
  endif

  exec prefix . cmd
endfunction

if has('nvim')
  " Alt-hjkl key bindings, for nvim
  nnoremap <A-/> :echo DetermineLocation()<CR>
  nnoremap <A-K> :call MyResize('k')<CR>
  nnoremap <A-J> :call MyResize('j')<CR>
  nnoremap <A-L> :call MyResize('l')<CR>
  nnoremap <A-H> :call MyResize('h')<CR>
  nnoremap <A-=> :call MyResize('=')<CR>
else
  " Alt-hjkl key bindings, but in printed character, otherwise vim cannot
  " recognize (this is for vim)
  nnoremap / :echo DetermineLocation()<CR>
  nnoremap K :call MyResize('k')<CR>
  nnoremap J :call MyResize('j')<CR>
  nnoremap L :call MyResize('l')<CR>
  nnoremap H :call MyResize('h')<CR>
  nnoremap = :call MyResize('=')<CR>
endif

" }}}

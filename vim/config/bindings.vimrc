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

nnoremap <leader>v <C-w>v<C-w>h
nnoremap <leader>s <C-w>s<C-w>k
nnoremap <leader>x :vsplit $MYVIMRC<cr><C-w>L<cr>
nnoremap <leader>q :copen<cr>
"nnoremap <leader>v <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Split selected text into lines
vnoremap <leader>k :s/ /\r/g<cr>


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

" Pin and swap window {{{

" move window to absolute top, left, right, or bottom
nnoremap <C-J> <C-W>J
nnoremap <C-K> <C-W>K
nnoremap <C-L> <C-W>L
nnoremap <C-H> <C-W>H

nmap J :call WindowSwap#EasyWindowSwap()<CR><C-j>:call WindowSwap#EasyWindowSwap()<CR>
nmap K :call WindowSwap#EasyWindowSwap()<CR><C-k>:call WindowSwap#EasyWindowSwap()<CR>
nmap L :call WindowSwap#EasyWindowSwap()<CR><C-l>:call WindowSwap#EasyWindowSwap()<CR>
nmap H :call WindowSwap#EasyWindowSwap()<CR><C-h>:call WindowSwap#EasyWindowSwap()<CR>

" }}}

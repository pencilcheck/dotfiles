" Airline {{{

"let g:airline_theme = 'wombat'
"let g:airline_theme = 'dark'
"let g:airline_theme = 'murmur'
let g:airline_theme='one'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tmuxline#enabled = 0 "so it doens't overwrite tmux settings

" }}}
" Promptline {{{

let g:promptline_theme = 'jelly'
let g:promptline_preset = {
      \'a' : [ promptline#slices#cwd() ],
      \'b' : [ promptline#slices#git_status() ],
      \'c' : [ promptline#slices#jobs() ],
      \'z' : [ promptline#slices#vcs_branch() ],
      \'warn' : [ promptline#slices#last_exit_code(), promptline#slices#battery() ]}

" }}}

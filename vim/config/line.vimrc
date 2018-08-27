" Promptline {{{

let g:promptline_theme = 'jelly'
let g:promptline_preset = {
      \'a' : [ promptline#slices#cwd() ],
      \'b' : [ promptline#slices#git_status() ],
      \'c' : [ promptline#slices#jobs() ],
      \'z' : [ promptline#slices#vcs_branch() ],
      \'warn' : [ promptline#slices#last_exit_code(), promptline#slices#battery() ]}

" }}}

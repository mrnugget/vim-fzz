if exists("g:loaded_fzz")
  finish
endif

let g:loaded_fzz = 1

command! -nargs=* -complete=file Fzz call fzz#Fzz("grep", <f-args>)

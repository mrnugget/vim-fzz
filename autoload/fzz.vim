if exists("g:autoloaded_fzz")
  finish
endif

let g:autoloaded_fzz = 1

let s:fzz_executable = "fzz"
let s:ag_cmd = "ag --nogroup --nocolor"
let s:ag_executable = get(split(l:ag_cmd, " "), 0)

function! fzz#Fzz(...)
  if !executable(s:fzz_executable)
    echoe "Fzz command '" . s:fzz_executable . "' not found. Is in your $PATH?"
    return
  endif

  if !executable(s:ag_executable)
    echoe "Fzz command '" . s:ag_executable . "' not found. Is in your $PATH?"
    return
  endif

  let l:lastarg = a:000[-1]
  if isdirectory(l:lastarg)
    let l:fzzdir = l:lastarg
    let l:fzzargs = join(a:000[:-2], ' ')
  else
    let l:fzzdir = ""
    let l:fzzargs = join(a:000, ' ')
  end

  let l:fzzprg = s:fzz_executable . " " . s:ag_cmd . " {{$*}} " . l:fzzdir

  let grepprg_bak=&grepprg
  try
    let &grepprg=l:fzzprg
    execute "grep " . escape(l:fzzargs, '|')
  finally
    let &grepprg=grepprg_bak
  endtry
endfunction

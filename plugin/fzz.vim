function! Fzz(...)
  let l:fzz_executable = "fzz"
  if !executable(l:fzz_executable)
    echoe "Fzz command '" . l:fzz_executable . "' not found. Is in your $PATH?"
    return
  endif

  let l:ag_cmd = "ag --nogroup --nocolor"
  let l:ag_executable = get(split(l:ag_cmd, " "), 0)
  if !executable(l:ag_executable)
    echoe "Fzz command '" . l:ag_executable . "' not found. Is in your $PATH?"
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

  let l:fzzprg = l:fzz_executable . " " . l:ag_cmd . " {{$*}} " . l:fzzdir

  let grepprg_bak=&grepprg
  try
    let &grepprg=l:fzzprg
    execute "grep " . escape(l:fzzargs, '|')
  finally
    let &grepprg=grepprg_bak
  endtry
endfunction

command! -nargs=+ -complete=file Fzz call Fzz(<f-args>)

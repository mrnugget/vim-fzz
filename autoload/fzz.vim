if exists("g:autoloaded_fzz")
  finish
endif

let g:autoloaded_fzz = 1

if !exists("g:fzz_search_cmd")
  let g:fzz_search_cmd = "ag --nogroup --nocolor"
endif

function! fzz#Fzz(grepcmd, ...)
  let l:fzz_executable = "fzz"
  let l:fzz_search_executable = get(split(g:fzz_search_cmd, " "), 0)

  if !executable(l:fzz_executable)
    echoe "Fzz command '" . l:fzz_executable . "' not found. Is in your $PATH?"
    return
  endif

  if !executable(l:fzz_search_executable)
    echoe "Fzz command '" . l:fzz_search_executable . "' not found. Is in your $PATH?"
    return
  endif

  if a:0 == 0
    let l:fzzdir = ""
    let l:fzzargs = ""
  elseif isdirectory(a:000[-1])
    let l:fzzdir = a:000[-1]
    let l:fzzargs = join(a:000[:-2], ' ')
  else
    let l:fzzdir = ""
    let l:fzzargs = join(a:000, ' ')
  end

  let l:fzzprg = l:fzz_executable . " " . g:fzz_search_cmd . " {{$*}} " . l:fzzdir

  let grepprg_bak=&grepprg
  try
    let &grepprg=l:fzzprg
    execute a:grepcmd . " " . escape(l:fzzargs, '|')
  finally
    let &grepprg=grepprg_bak
  endtry
endfunction

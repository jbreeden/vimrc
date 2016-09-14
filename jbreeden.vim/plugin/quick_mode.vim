let s:quick_mode_active = 0
let s:last_clobbered = {}

" Deactivates a quick mode.
" Arguments:
" - clobbered: A dictionary of mapping lhs to rhs that were
"     clobbered when the mode was entered.
" Returns: 0 if the mode could not be activated. Else 1.
function! QuickModeExit(clobbered)
  for key in keys(a:clobbered)
    if len(a:clobbered[key])
      execute "nnoremap " . key . " " . a:clobbered[key]
    else
      execute "nunmap " . key
    endif
  endfor
  let s:last_clobbered = {}
  let s:quick_mode_active = 0
endfunction

" Activates a quick mode.
" Arguments:
" - mappings: A dictionary of mapping lhs to rhs
" - clobbered: An empty dictionary that will be filled with any clobbered
"     mappings.
" Returns: 0 if the mode could not be activated. Else 1.
function! QuickMode(mappings, clobbered)
  if s:quick_mode_active
    call QuickModeExit(s:last_clobbered)
  endif

  for key in keys(a:mappings)
    let a:clobbered[key] = maparg(key)
  endfor
  for key in keys(a:mappings)
    execute "nnoremap " . key . " " . a:mappings[key]
  endfor

  let s:quick_mode_active = 1
  let s:last_clobbered = a:clobbered
  return 1
endfunction


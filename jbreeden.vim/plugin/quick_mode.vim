let s:quick_mode_active = 0

function! QuickModeExit(clobbered)
  for key in keys(a:clobbered)
    if len(a:clobbered[key])
      execute "nnoremap " . key . " " . a:clobbered[key]
    else
      execute "nunmap " . key
    endif
  endfor
  let s:quick_mode_active = 0
endfunction

function! QuickMode(mappings, clobbered)
  if s:quick_mode_active
    echo "Cowardly refusing to active two quick modes at once"
    return 0
  endif
  let clobbered = {}
  for key in keys(a:mappings)
    let clobbered[key] = maparg(key)
  endfor
  for key in keys(a:mappings)
    execute "nnoremap " . key . " " . a:mappings[key]
  endfor
  let s:quick_mode_active = 1
  call extend(a:clobbered, clobbered)
  return 1
endfunction


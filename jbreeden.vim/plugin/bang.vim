function! <SID>GetLines(line1, line2)
  let line1 = a:line1
  let line2 = a:line2
  if a:line1 > a:line2
    let line1 = a:line2
    let line2 = a:line1
  endif 

  let i = line1
  let lines = ""
  while i <= line2
    let lines .= getline(i) . "\n"
    let i = i + 1
  endwhile
  return lines
endfunction

function! Bang(bang, mode) range
  let cmd = <SID>GetLines(a:firstline, a:lastline)
  
  let insert_position = a:lastline
  if a:bang == '!'
    new
    set bufhidden=hide
    set buftype=nofile
    let insert_position = 0
  endif

  if a:mode == '' || a:mode == 'sh' || a:mode == 'bash'
    call append(insert_position, split(system(cmd), "\n"))
    execute ":" . insert_position
  elseif a:mode == 'rb' || a:mode == 'ruby'
    call append(insert_position, split(system('ruby', cmd), "\n"))
    execute ":" . insert_position
  elseif a:mode == 'js' || a:mode == 'node'
    call append(insert_position, split(system('node', cmd), "\n"))
    execute ":" . insert_position
  elseif a:mode == 'ex'
    execute a:cmd
  endif
endfunction
command! -nargs=? -range -bang Bang <line1>,<line2>call Bang("<bang>", "<args>")


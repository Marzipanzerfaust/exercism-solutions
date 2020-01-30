function! Raindrops(number) abort
  let output = []

  if IsDivisible(a:number, 3)
    call add(output, "Pling")
  endif

  if IsDivisible(a:number, 5)
    call add(output, "Plang")
  endif

  if IsDivisible(a:number, 7)
    call add(output, "Plong")
  endif

  if empty(output)
    call add(output, string(a:number))
  endif

  return join(output, "")
endfunction

function! IsDivisible(x, y)
  return fmod(a:x, a:y) == 0
endfunction

function! Verse(verse) abort
  if a:verse == 0
    return "No more bottles of beer on the wall, no more bottles of beer.\n
          \Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  elseif a:verse == 1
    return "1 bottle of beer on the wall, 1 bottle of beer.\n
          \Take it down and pass it around, no more bottles of beer on the wall.\n"
  else
    return s:Bottles(a:verse)." of beer on the wall, ".s:Bottles(a:verse)." of beer.\n
          \Take one down and pass it around, ".s:Bottles(a:verse - 1)." of beer on the wall.\n"
  endif
endfunction

function! Verses(start, end) abort
  let verses = []

  for n in range(a:end, a:start)
    call insert(verses, Verse(n), 0)
  endfor

  return join(verses, "\n")
endfunction

function! s:Bottles(n)
  if a:n == 0
    return "No more bottles"
  elseif a:n == 1
    return "1 bottle"
  else
    return a:n." bottles"
  endif
endfunction

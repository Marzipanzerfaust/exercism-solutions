let s:alphabet = split("abcdefghijklmnopqrstuvwxyz", '\zs')

function! IsPangram(sentence) abort
  let lower = tolower(a:sentence)

  for letter in s:alphabet
    if lower !~ letter
      return 0
    endif
  endfor

  return 1
endfunction

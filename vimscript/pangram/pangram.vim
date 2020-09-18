let s:alphabet = split("abcdefghijklmnopqrstuvwxyz", '\zs')

function! IsPangram(sentence) abort
  return len(a:sentence) >= 26 &&
        \ uniq(sort(split(tolower(substitute(a:sentence, '\A', "", "g")), '\zs'))) == s:alphabet
endfunction

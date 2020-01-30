function! Transform(scores) abort
  let output = {}

  for [score, letters] in items(a:scores)
    for letter in letters
      let output[tolower(letter)] = str2nr(score)
    endfor
  endfor

  return output
endfunction

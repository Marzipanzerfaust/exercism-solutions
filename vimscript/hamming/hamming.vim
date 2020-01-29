function! Distance(strand1, strand2)
  if strlen(a:strand1) != strlen(a:strand2)
    throw "left and right strands must be of equal length"
  endif

  let count = 0

  for l:i in range(strlen(a:strand1))
    if a:strand1[l:i] != a:strand2[l:i]
      let count += 1
    endif
  endfor

  return count
endfunction

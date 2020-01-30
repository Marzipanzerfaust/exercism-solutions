function! NucleotideCounts(strand) abort
  let counter = {
        \ 'A': 0,
        \ 'C': 0,
        \ 'T': 0,
        \ 'G': 0
        \ }

  for idx in range(strchars(a:strand))
    let char = a:strand[idx]

    if !has_key(counter, char)
      throw "Invalid nucleotide in strand"
    endif

    let counter[char] += 1
  endfor

  return counter
endfunction

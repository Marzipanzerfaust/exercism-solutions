function! NucleotideCounts(strand) abort
  let counter = {
        \ "A": 0,
        \ "C": 0,
        \ "T": 0,
        \ "G": 0
        \ }

  for char in split(a:strand, '\zs')
    try
      let counter[char] += 1
    catch /E734/
      throw "Invalid nucleotide in strand"
    endtry
  endfor

  return counter
endfunction

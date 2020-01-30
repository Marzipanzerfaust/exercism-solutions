let s:replacements = {
      \ 'G': 'C',
      \ 'C': 'G',
      \ 'T': 'A',
      \ 'A': 'U'
      \ }

function! ToRna(strand) abort
  let output = []

  for char in split(a:strand, '\zs')
    if !has_key(s:replacements, char)
      return ""
    endif

    call add(output, s:replacements[char])
  endfor

  return join(output, "")
endfunction

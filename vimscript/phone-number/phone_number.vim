let s:valid_nanp = '^1\=\([2-9]\d\{2}\)\([2-9]\d\{2}\)\(\d\{4}\)$'

function! ToNANP(number) abort
  let digits = substitute(a:number, '\D', "", "g")

  let matches = matchlist(digits, s:valid_nanp)

  return join(matches[1:3], "")
endfunction

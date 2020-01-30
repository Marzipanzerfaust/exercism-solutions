let s:alphabet = "abcdefghijklmnopqrstuvwxyz"
let s:reversed = join(reverse(split(s:alphabet, '\zs')), "")

function! AtbashDecode(cipher) abort
  return tr(substitute(a:cipher, '\s', "", "g"), s:reversed, s:alphabet)
endfunction

function! AtbashEncode(plaintext) abort
  let translated = tr(substitute(tolower(a:plaintext), '\W', "", "g"), s:alphabet, s:reversed)

  let output = []

  for idx in range(0, strchars(translated) - 1, 5)
    call add(output, strcharpart(translated, idx, 5))
  endfor

  return join(output, " ")
endfunction

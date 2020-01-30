function! LargestProduct(digits, span) abort
  if a:digits =~ '\D'
    throw "invalid input"
  endif

  if a:span > strchars(a:digits) || a:span < 0
    return -1
  endif

  if a:span == strchars(a:digits)
    return s:Product(a:digits)
  endif

  let products = []

  for i in range(strchars(a:digits) - a:span + 1)
    let slice = strcharpart(a:digits, i, a:span)

    call add(products, s:Product(slice))
  endfor

  return max(products)
endfunction

function! s:Product(digits)
  let product = 1

  for digit in split(a:digits, '\zs')
    let product *= str2nr(digit)
  endfor

  return product
endfunction

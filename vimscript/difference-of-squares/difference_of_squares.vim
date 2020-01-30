function! DifferenceOfSquares(number) abort
  return SquareOfSum(a:number) - SumOfSquares(a:number)
endfunction

function! SquareOfSum(number) abort
  return float2nr(pow(s:Sum(range(1, a:number)), 2))
endfunction

function! SumOfSquares(number) abort
  return s:Sum(map(range(1, a:number), 'float2nr(pow(v:val, 2))'))
endfunction

function! s:Sum(numbers)
  let total = 0

  for l:n in a:numbers
    let total += l:n
  endfor

  return total
endfunction

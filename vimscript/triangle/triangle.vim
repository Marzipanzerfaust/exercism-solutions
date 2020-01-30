function! Equilateral(triangle) abort
  let sides = sort(copy(a:triangle))

  return s:Valid(sides) && len(uniq(sides)) == 1
endfunction

function! Isosceles(triangle) abort
  let sides = sort(copy(a:triangle))

  return s:Valid(sides) && len(uniq(sides)) <= 2
endfunction

function! Scalene(triangle) abort
  let sides = sort(copy(a:triangle))

  return s:Valid(sides) && len(uniq(sides)) == 3
endfunction

" NOTE: `triangle` must be sorted first
function! s:Valid(triangle)
  let [a, b, c] = a:triangle

  return a > 0 && b > 0 && c > 0 && a + b > c
endfunction

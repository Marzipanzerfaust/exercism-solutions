let s:romans = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
let s:decimals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]

function! ToRoman(number) abort
  let output = []
  let n = a:number

  for idx in range(len(s:romans))
    let roman = s:romans[idx]
    let decimal = s:decimals[idx]

    let quotient = n / decimal

    call add(output, repeat(roman, quotient))

    let n = float2nr(fmod(n, decimal))
  endfor

  return join(output, "")
endfunction

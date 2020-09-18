let s:allergens = [
      \ "eggs", "peanuts", "shellfish", "strawberries",
      \ "tomatoes", "chocolate", "pollen", "cats"
      \ ]

let s:scores = [1, 2, 4, 8, 16, 32, 64, 128]

function! AllergicTo(score, allergy) abort
  return and(a:score, s:scores[index(s:allergens, a:allergy)])
endfunction

function! List(score) abort
  return filter(copy(s:allergens), { _, val -> AllergicTo(a:score, val) })
endfunction

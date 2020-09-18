function! FindAnagrams(candidates, subject) abort
  return filter(copy(a:candidates), { _, val -> s:IsAnagram(val, a:subject) })
endfunction

" One string is an anagram of the other if the sorted, lowercased array
" of its characters is equal to that of the other
function! s:IsAnagram(a, b) abort
  let a = tolower(a:a)
  let b = tolower(a:b)

  if l:a == l:b
    return 0
  else
    return sort(split(l:a, '\zs')) == sort(split(l:b, '\zs'))
  endif
endfunction

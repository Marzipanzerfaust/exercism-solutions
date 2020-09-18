function! Response(remark) abort
  if s:is_blank(a:remark)
    return "Fine. Be that way!"
  elseif s:is_question(a:remark)
    if s:is_yell(a:remark)
      return "Calm down, I know what I'm doing!"
    else
      return "Sure."
    endif
  elseif s:is_yell(a:remark)
    return "Whoa, chill out!"
  else
    return "Whatever."
  endif
endfunction

function! s:is_blank(text)
  return a:text !~ '\S'
endfunction

function! s:is_question(text)
  return trim(a:text) =~ '?$'
endfunction

function! s:is_yell(text)
  return a:text =~ '\u' && a:text !~ '\l'
endfunction

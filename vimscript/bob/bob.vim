function! Response(remark) abort
  let is_blank = s:IsBlank(a:remark)
  let is_question = s:IsQuestion(a:remark)
  let is_yell = s:IsYell(a:remark)

  if is_blank
    return "Fine. Be that way!"
  elseif is_question && is_yell
    return "Calm down, I know what I'm doing!"
  elseif is_question
    return "Sure."
  elseif is_yell
    return "Whoa, chill out!"
  else
    return "Whatever."
  endif
endfunction

function! s:IsBlank(text)
  return a:text !~ '[[:graph:]]'
endfunction

function! s:IsQuestion(text)
  return trim(a:text) =~ '?$'
endfunction

function! s:IsYell(text)
  return a:text =~ '[[:upper:]]' && a:text !~ '[[:lower:]]'
endfunction

function! WordCount(phrase) abort
  let phrase = tolower(a:phrase)

  " First, clear anything that isn't an alphanumeric character or an
  " apostrophe
  let phrase = substitute(phrase, "[^[:alnum:]']", " ", "g")
  " Then, clear any apostrophes that appear at the beginning or end of
  " words
  let phrase = substitute(phrase, " '\\|' ", " ", "g")

  let counter = {}

  for word in split(phrase)
    if has_key(counter, word)
      let counter[word] += 1
    else
      let counter[word] = 1
    endif
  endfor

  return counter
endfunction

function! LeapYear(year) abort
  return fmod(a:year, 4) == 0 && fmod(a:year, 100) != 0 || fmod(a:year, 400) == 0
endfunction

#!/usr/bin/env bash

trans_umlauts() {
  # Scan the input string for any umlaut characters and convert them to
  # an equivalent ASCII character; then, return the converted string

  new_string=''

  for ((i = 0; i < ${#1}; i++)); do
    char=${1:$i:1}
    hex=$(echo $char | xxd -ps)
    hex=${hex:0:4}

    case $hex in
      c384)
        new_string+='A'
        ;;
      c38b)
        new_string+='E'
        ;;
      c38f)
        new_string+='I'
        ;;
      c396)
        new_string+='O'
        ;;
      c39c)
        new_string+='U'
        ;;
      c3a4)
        new_string+='a'
        ;;
      c3ab)
        new_string+='e'
        ;;
      c3af)
        new_string+='i'
        ;;
      c3b6)
        new_string+='o'
        ;;
      c3bc)
        new_string+='u'
        ;;
      c3bf)
        new_string+='y'
        ;;
      *)
        new_string+=$char
        ;;
    esac
  done

  echo $new_string
}

# Umlaut characters translated to ASCII characters
no_umlauts=$(trans_umlauts "$1")
# Only alphabetic characters
letters=$(echo $no_umlauts | tr -cd '[:alpha:]' | tr -d '[:space:]')
# Only non-alphabetic characters
nonletters=$(echo $no_umlauts | tr -d '[:alpha:]' | tr -d '[:space:]')
# All lowercase characters converted to uppercase
capitals=$(echo $letters | tr '[:lower:]' '[:upper:]')

if [[ "$capitals" == "$letters" ]] && ! [[ -z "$letters" ]]; then
  echo 'Whoa, chill out!'
elif [[ "${nonletters:(-1)}" == '?' ]]; then
  echo 'Sure.'
elif [[ -z $letters && -z $nonletters ]]; then
  echo 'Fine. Be that way!'
else
  echo 'Whatever.'
fi

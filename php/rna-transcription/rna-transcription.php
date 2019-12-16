<?php

function toRna(string $s) : string {
  return join(array_map("transcribe", str_split($s)));
}

function transcribe(string $nucleotide) : string {
  switch ($nucleotide) {
  case 'G': return 'C';
  case 'C': return 'G';
  case 'T': return 'A';
  case 'A': return 'U';
  default: throw new Exception;
  }
}

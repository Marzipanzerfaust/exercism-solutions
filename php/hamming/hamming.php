<?php

function distance(string $strandA, string $strandB) : int
{
  $lenA = strlen($strandA);
  $lenB = strlen($strandB);

  if ($lenA != $lenB)
    throw new InvalidArgumentException("DNA strands must be of equal length.");

  $distance = 0;

  for ($i = 0; $i < $lenA; ++$i) {
    if ($strandA[$i] != $strandB[$i])
      ++$distance;
  }

  return $distance;
}

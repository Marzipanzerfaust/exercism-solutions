<?php

function isValid(string $s) : bool {
  $stripped = preg_replace("/\s/", "", $s);

  if (strlen($stripped) <= 1) return false;
  if (!ctype_digit($stripped)) return false;

  $sum = 0;

  foreach (array_reverse(str_split($stripped)) as $idx => $digit) {
    if ($idx % 2 == 0) {
      $sum += $digit;
    } else {
      $doubled = $digit * 2;
      if ($doubled > 9) $doubled -= 9;
      $sum += $doubled;
    }
  }

  return $sum % 10 == 0;
}

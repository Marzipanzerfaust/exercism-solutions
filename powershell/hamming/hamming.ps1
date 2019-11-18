function Compute($Strand1, $Strand2) {
  if ($Strand1.Length -ne $Strand2.Length) {
    throw 'Mismatching string lengths'
  }

  $Distance = 0

  for ($i = 0; $i -lt $Strand1.Length; $i++) {
    if ($Strand1[$i] -ne $Strand2[$i]) {
      $Distance++
    }
  }

	return $Distance
}

<?php

function from($date) {
  return $date->add(
    DateInterval::createFromDateString("1000000000 seconds")
  );
}

<?php

// In order to handle the umlaut tests, this class requires that the
// `intl` extension be enabled in php.ini

class Bob {
  public function respondTo(string $s) : string {
    if (self::isText($s)) {
      if (self::isQuestion($s) && self::isYell($s))
        return "Calm down, I know what I'm doing!";
      else if (self::isQuestion($s))
        return "Sure.";
      else if (self::isYell($s))
        return "Whoa, chill out!";
      else
        return "Whatever.";
    } else {
      return "Fine. Be that way!";
    }
  }

  private static function isText(string $s) : bool {
    foreach (self::mbSplit($s) as $char)
      if (IntlChar::isGraph($char))
        return true;

    return false;
  }

  private static function isQuestion(string $s) : bool {
    return preg_match("/\?\s*$/", $s);
  }

  private static function isYell(string $s) : bool {
    $out = false;

    foreach (self::mbSplit($s) as $char)
      if (IntlChar::isUpper($char)) {
        $out = true;
      } else if (IntlChar::isLower($char)) {
        $out = false;
        break;
      }

    return $out;
  }

  private static function mbSplit(string $s) : array {
    return preg_split("//u", $s, null, PREG_SPLIT_NO_EMPTY);
  }
}

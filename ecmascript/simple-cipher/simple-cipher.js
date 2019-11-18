'use strict'

class Cipher {
  constructor() {
    this.key = 'abcdefghijklmnopqrstuvwxyz'
  }

  encode(string) {
    // Return the shifted version of the given string
    return Array.from(string).map(i => this._shift(i, 4)).join('')
  }

  decode(string) {
    return Array.from(string).map(i => this._shift(i, -4)).join('')
  }

  _shift(i, n) {
    // Return the character in the key at the current index plus n
    return this.key[this.key.indexOf(i) + n]
  }
}

module.exports = Cipher

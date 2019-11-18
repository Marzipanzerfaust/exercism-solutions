'use strict'

class DnaTranscriber {
  toRna(strand) {
    let array = Array.from(strand)

    if (array.some(function(x) {
      return !('GCTA'.includes(x))
    })) {
      throw new Error("Invalid input")
    }

    return array.map(function(x) {
      switch (x) {
        case 'G':
          return 'C'
        case 'C':
          return 'G'
        case 'T':
          return 'A'
        case 'A':
          return 'U'
      }
    }).join('')
  }
}

module.exports = DnaTranscriber
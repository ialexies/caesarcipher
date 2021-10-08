class EncoderDecoderController {
  // caesarCipherEncoder(List<dynamic> phrase, int shift) {
  //   List<dynamic> encodedListInt = []; //list of encoded int
  //   List<dynamic> encodedListWords = []; //List of encoded words

  //   int wordCount = phrase.length;
  //   for (int i = 0; i < wordCount; i++) {
  //     encodedListInt.add(wordToListAscii(phrase[i], shift));
  //   }

  //   encodedListWords = listAsciiToWords(encodedListInt);

  //   return encodedListWords;
  // }

  caesarCipherEncoder(List<dynamic> phrase, int shift) {
    List<dynamic> encodedListInt = []; //list of encoded int
    List<dynamic> encodedListWords = [];

    int wordCount = phrase.length;
    for (int i = 0; i < wordCount; i++) {
//         print(wordToListAscii(phrase[i]));
      encodedListInt.add(wordToListAscii(phrase[i], shift));
    }

    encodedListWords = listAsciiToWords(encodedListInt, shift);

    return encodedListWords;
  }

  wordToListAscii(String word, int shift) {
    int _shift = shift;
    int wordCount = word.length;
    List<int> wordToAscii = word.codeUnits;
    List<int> wordEncoded = [];

    for (int i = 0; i < wordCount; i++) {
      wordEncoded.add(wordToAscii[i] + _shift);
    }

    return wordEncoded;
  }

  // listAsciiToWords(encodedListInt) {
  //   List<String> decodedWords = [];

  //   for (int i = 0; i < encodedListInt.length; i++) {
  //     decodedWords.add(String.fromCharCodes(encodedListInt[i]));
  //   }

  //   return decodedWords;
  // }

  encodedIntToWord(encodedListInt, shift) {
    String word = "";

    for (int i = 0; i < encodedListInt.length; i++) {
//        print("--");
//       print(encodedListInt);
//         print("--");

      if ((encodedListInt[i]) > 122) {
//
        print(encodedListInt[i]);

        word = word + String.fromCharCode((encodedListInt[i] - 122) + 96);
      } else {
        word = word + String.fromCharCode(encodedListInt[i]);
      }
    }

    return word;
  }

  listAsciiToWords(encodedListInt, int shift) {
    List<String> decodedWords = [];

    for (int i = 0; i < encodedListInt.length; i++) {
//     decodedWords.add( String.fromCharCodes(encodedListInt[i] ));
      decodedWords.add(encodedIntToWord(encodedListInt[i], shift));
    }
    print(encodedListInt);
//   print(decodedWords);
    return decodedWords;
  }
}

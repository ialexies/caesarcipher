class EncoderDecoderController {
  caesarCipherEncoder(List<dynamic> phrase, int shift) {
    List<dynamic> encodedListInt = []; //list of encoded int
    List<dynamic> encodedListWords = []; //List of encoded words

    int wordCount = phrase.length;
    for (int i = 0; i < wordCount; i++) {
      encodedListInt.add(wordToListAscii(phrase[i], shift));
    }

    encodedListWords = listAsciiToWords(encodedListInt);

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

  listAsciiToWords(encodedListInt) {
    List<String> decodedWords = [];

    for (int i = 0; i < encodedListInt.length; i++) {
      decodedWords.add(String.fromCharCodes(encodedListInt[i]));
    }

    return decodedWords;
  }
}

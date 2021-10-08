class EncoderDecoderController {
  //main method for encoding
  caesarCipherEncoder(List<dynamic> phrase, int shift) {
    List<dynamic> encodedListInt = []; //list of encoded int
    List<dynamic> encodedListWords = [];

    int wordCount = phrase.length;

    //loop in the list of words in phrase
    for (int i = 0; i < wordCount; i++) {
      encodedListInt.add(wordToListAscii(phrase[i], shift));
    }

    // convert the list of encoded words in a form of int to letters for the final output of encoded words
    encodedListWords = listAsciiToWords(encodedListInt, shift);

    return encodedListWords;
  }

  //Convert each words to encoded list of character
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

  //convert each character to int, when the character count is more than the z or 122 as code, it will go back to a or 97 in acii code
  encodedIntToWord(encodedListInt, shift) {
    String word = "";

    for (int i = 0; i < encodedListInt.length; i++) {
      if ((encodedListInt[i]) > 122) {
        word = word + String.fromCharCode((encodedListInt[i] - 122) + 96);
      } else {
        word = word + String.fromCharCode(encodedListInt[i]);
      }
    }

    return word;
  }

  //Convert the final encoded list of int to a list of words  for the output
  listAsciiToWords(encodedListInt, int shift) {
    List<String> decodedWords = [];

    for (int i = 0; i < encodedListInt.length; i++) {
      decodedWords.add(encodedIntToWord(encodedListInt[i], shift));
    }
    return decodedWords;
  }
}

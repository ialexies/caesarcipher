import 'package:flutter/widgets.dart';

import 'app/modules/encode/controller/encoder_decoder_controller.dart';
import 'app/modules/encode/model/caesarcipher.dart';

class GetItCipherNotifier extends ChangeNotifier {
  CaesarCipher _caesarCipher = CaesarCipher([], 1, false);
  List _currentEncoded = [];
  int _numWords = 2;

  generateWords(CaesarCipher response) {
    List<String> sampleWord = [];
    _caesarCipher.words = response.words;

    // updateCurrentEncoded(_caesarCipher.words);
    updateCurrentEncoded(
        EncoderDecoderController().caesarCipherEncoder(response.words, shift));

    return notifyListeners();
  }

  updateNumWords(int numWords) {
    _numWords = numWords;
    return notifyListeners();
  }

  updateCurrentEncoded(List<dynamic> encodedWords) {
    _currentEncoded = encodedWords;
    return notifyListeners();
  }

  get wordings => _caesarCipher.words;
  get shift => _caesarCipher.shift;
  get numWords => _numWords;
  get currendEncoded => _currentEncoded;
}

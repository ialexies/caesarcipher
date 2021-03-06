// import 'package:caesarcipher/app/modules/encod_decode/controller/encoder_decoder_controller.dart';
import 'package:caesarcipher/app/modules/encode_decode/controller/encoder_decoder_controller.dart';
import 'package:caesarcipher/app/modules/encode_decode/model/caesarcipher.dart';
import 'package:flutter/widgets.dart';
// import 'app/modules/encod_decode/controller/encoder_decoder_controller.dart';

class GetItCipherNotifier extends ChangeNotifier {
  CaesarCipher _caesarCipher = CaesarCipher([], 0, false);
  List _generatePhrase = [];
  List _currentEncoded = [];
  String _checkerResult = "\"Click Validate\"";
  int _numWords = 0;
  bool _isLoading = false;
  String _checkerUserAnswer = "";

  generateWords(CaesarCipher response) {
    _caesarCipher.words = response.words;
    _caesarCipher.shift = response.shift;

    updateCurrentEncoded(
        EncoderDecoderController().caesarCipherEncoder(response.words, shift));

    _generatePhrase = response.words;

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

  updateIsLoading(bool val) {
    _isLoading = val;
    return notifyListeners();
  }

  updateCheckerUserAnswer(String userAnswer) {
    _checkerUserAnswer = userAnswer.trim().toLowerCase();
    notifyListeners();
  }

  updateCheckerResult(String resultString) {
    _checkerResult = resultString;
    notifyListeners();
  }

  get wordings => _caesarCipher.words;
  get shift => _caesarCipher.shift;
  get numWords => _numWords;
  get currendEncoded => _currentEncoded;
  get isLoading => _isLoading;
  get generatedPhrase => _generatePhrase;
  get checkerUserAnswer => _checkerUserAnswer;
  get checkerResult => _checkerResult;
}

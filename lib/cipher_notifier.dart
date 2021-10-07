import 'package:flutter/widgets.dart';

import 'app/modules/encode/model/caesarcipher.dart';

class GetItCipherNotifier extends ChangeNotifier {
  CaesarCipher _caesarCipher = CaesarCipher(["Thes", "Brown", "Fox"], 3, false);

  generateWords(CaesarCipher response) {
    // _caesarCipher.words = ['fdf', 'abc'];
    _caesarCipher.words = response.words;

    return notifyListeners();
  }

  get wordings => _caesarCipher.words;
  get shift => _caesarCipher.shift;
}

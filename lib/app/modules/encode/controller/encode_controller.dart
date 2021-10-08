import 'package:caesarcipher/app/data/services/caesar_service.dart';
import 'package:caesarcipher/app/modules/encode/model/caesarcipher.dart';
import 'package:caesarcipher/cipher_notifier.dart';

import 'package:http/http.dart';

class Encodecontroller {
  List Words = [];

  generateWords(int numWords) async {
    try {
      CaesarCipher response = await CaesarService().getPhraseAndShfit(numWords);
      // dynamic generatedwords =  get<GetItCipherNotifier>().generateWords(response);

      return response;
    } finally {}
  }

  encode(List words) {
    print('hello encode');
  }
}

import 'package:caesarcipher/app/data/services/caesar_service.dart';
import 'package:caesarcipher/app/modules/encode/model/caesarcipher.dart';

class Encodecontroller {
  List Words = [];

  generateWords(int numWords) async {
    try {
      CaesarCipher response = await CaesarService().getPhraseAndShfit();

      print(response.toString());
      return response;
    } finally {}
  }
}

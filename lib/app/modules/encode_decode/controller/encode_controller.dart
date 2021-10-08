import 'package:caesarcipher/app/data/services/caesar_service.dart';
import 'package:caesarcipher/app/modules/encode_decode/model/caesarcipher.dart';

class Encodecontroller {
  List Words = [];

  //call the service that connects to the repository to request the data from the api
  generateWords(int numWords) async {
    try {
      CaesarCipher response = await CaesarService().getPhraseAndShfit(numWords);
      return response;
    } finally {}
  }
}

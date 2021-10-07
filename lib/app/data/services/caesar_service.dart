import 'dart:convert';

import 'package:caesarcipher/app/data/repository/repository.dart';
import 'package:caesarcipher/app/modules/encode/model/caesarcipher.dart';

class CaesarService {
  Repository repository = Repository();

  getWordsToEncode(int numWords) async {
    var response = await repository.httpGetWords(numWords);
    var jsonResponse = json.decode(response.body);

    return jsonResponse;
  }

  getShiftToEncode() async {
    var response = await repository.httpGetShift();
    var jsonResponse = json.decode(response.body);

    return jsonResponse[0];
  }

  getPhraseAndShfit(int numWords) async {
    List words = await getWordsToEncode(numWords);

    // print(dsd;
    int shift = await getShiftToEncode();

    CaesarCipher phrase = CaesarCipher(words, shift, false);

    return phrase;
  }
}

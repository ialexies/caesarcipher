import 'dart:convert';

import 'package:caesarcipher/app/data/repository/repository.dart';
import 'package:caesarcipher/app/modules/encode/model/caesarcipher.dart';

class CaesarService {
  Repository repository = Repository();

  getWordsToEncode() async {
    var response = await repository.httpGetWords();
    var jsonResponse = json.decode(response.body);

    return jsonResponse;
  }

  getShiftToEncode() async {
    var response = await repository.httpGetShift();
    var jsonResponse = json.decode(response.body);

    return jsonResponse[0];
  }

  getPhraseAndShfit() async {
    List words = await getWordsToEncode();

    // print(dsd;
    int shift = await getShiftToEncode();

    CaesarCipher phrase = CaesarCipher(words, shift, false);

    return phrase;
  }
}

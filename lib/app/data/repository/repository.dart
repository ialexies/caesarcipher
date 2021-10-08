import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Repository {
  httpGetWords(int numWords) async {
    Uri _urlWords = Uri.parse(
        "https://random-word-api.herokuapp.com/word?number=$numWords");
    return await http.get(_urlWords);
  }

  httpGetShift() async {
    final Uri _urlNumber = Uri.parse(
        "http://www.randomnumberapi.com/api/v1.0/random?min=1&max=5&count=1");
    return await http.get(_urlNumber);
  }
}

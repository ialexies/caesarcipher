import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Repository {
  final Uri _urlWords =
      Uri.parse("https://random-word-api.herokuapp.com/word?number=10");
  final Uri _urlNumber = Uri.parse(
      "http://www.randomnumberapi.com/api/v1.0/random?min=1&max=25&count=1");

  httpGetWords() async {
    return await http.get(_urlWords);
  }

  httpGetShift() async {
    return await http.get(_urlNumber);
  }
}

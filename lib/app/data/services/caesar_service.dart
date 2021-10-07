import 'package:caesarcipher/app/data/repository/repository.dart';

class CaesarService {
  Repository repository = Repository();

  getWordsToEncode() async {
    return await repository.httpGetWords();
  }

  getShiftToEncode() async {
    return await repository.httpGetShift();
  }
}

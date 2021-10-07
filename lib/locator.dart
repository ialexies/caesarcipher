import 'package:get_it/get_it.dart';
import 'cipher_notifier.dart';

final GetIt locator = GetIt.instance;

void setup() {
  locator.registerSingleton<GetItCipherNotifier>(
    GetItCipherNotifier(),
  );
}

import 'package:get_it/get_it.dart';
import '../data/services/navigation/index.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<NavigationServiceImpl>(() => NavigationServiceImpl());
}

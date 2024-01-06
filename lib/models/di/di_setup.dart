import 'package:get_it/get_it.dart';

import '../../viewmodels/address_translate_viewmodel.dart';
import '../../viewmodels/name_translate_viewmodel.dart';
import '../repository/address_translate_repository.dart';
import '../repository/address_translate_repository_impl.dart';
import '../repository/name_translate_repository.dart';
import '../repository/name_translate_repository_impl.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<AddressTranslateItemsRepository>(
      AddressTranslateItemsRepositoryImpl());
  getIt.registerFactory<AddressTranslateViewmodel>(() =>
      AddressTranslateViewmodel(
          repository: getIt<AddressTranslateItemsRepository>()));

  getIt.registerSingleton<NameTranslateItemsRepository>(
      NameTranslateItemsRepositoryImpl());
  getIt.registerFactory<NameTranslateViewmodel>(() => NameTranslateViewmodel(
      repository: getIt<NameTranslateItemsRepository>()));
}

import 'package:name_address_translator/models/model/name_translate_model.dart';

abstract interface class NameTranslateItemsRepository {
  Future<List<NameItemModel>?> getNameTranslates(String koreanName);
}

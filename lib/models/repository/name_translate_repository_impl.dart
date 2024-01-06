import 'package:name_address_translator/models/mapper/name_translate_mapper.dart';
import 'package:name_address_translator/models/repository/name_translate_repository.dart';

import '../model/name_translate_model.dart';
import '../source/name_translate_source.dart';

class NameTranslateItemsRepositoryImpl implements NameTranslateItemsRepository {
  final _api = NameTranslateApi();

  Future<List<NameItemModel>?> getNameTranslates(String koreanName) async {
    final nameModel = await _api.getNameInfoResult(koreanName);
    if (nameModel.aResult == null) {
      return [];
    }
    return nameModel.aResult![0].aItems!.map((e) => e.toNameItem()).toList();
  }
}

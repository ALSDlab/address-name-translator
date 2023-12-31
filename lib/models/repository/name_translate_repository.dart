import 'package:name_address_translator/models/mapper/name_translate_mapper.dart';
import 'package:name_address_translator/models/model/name_translate_model.dart';
import 'package:name_address_translator/models/source/name_translate_source.dart';

class NameTranslateItemsRepository {
  final _api = NameTranslateApi();

  Future<List<NameItemModel>?> getNameTranslates(String koreanName) async {
    final nameModel = await _api.getNameInfoResult(koreanName);
    if (nameModel.aResult == null) {
      return [];
    }
    return nameModel.aResult![0].aItems!.map((e) => e.toNameItem()).toList();
  }
}

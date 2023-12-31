import 'package:name_address_translator/models/model/name_translate_model.dart';
import 'package:name_address_translator/models/translateDto/name_translate_dto.dart';

extension DtoToNameModel on NameResults {
  NameItemModel toNameItem() {
    return NameItemModel(
      engName: name ?? 'No Information',
      accuracy: score ?? '-',
    );
  }
}

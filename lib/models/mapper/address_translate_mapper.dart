import 'package:name_address_translator/models/model/address_translate_model.dart';
import 'package:name_address_translator/models/translateDto/address_translate_dto.dart';

extension DtoToModel on Juso {
  AddressItemModel toAddressItem() {
    return AddressItemModel(
      zipNumber: zipNo ?? '-',
      engAddr: roadAddr ?? 'No Information',
      korAddr: korAddr ?? '주소정보없음',
    );
  }
}

extension DtoToCountModel on Common {
  AddressCountModel toAddressCount() {
    return AddressCountModel(
      totalCnt: totalCount ?? '0',
    );
  }
}

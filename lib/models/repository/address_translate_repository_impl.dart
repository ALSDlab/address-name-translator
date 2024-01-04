import 'package:name_address_translator/models/mapper/address_translate_mapper.dart';
import 'package:name_address_translator/models/repository/address_translate_repository.dart';
import 'package:name_address_translator/models/source/address_translate_source.dart';

class AddressTranslateItemsRepositoryImpl implements AddressTranslateItemsRepository{
  final _api = AddressTranslateApi();

  @override
  Future<List> getAddressTranslates(int currentPage, String keyword) async {
    final addressModel = await _api.getAddressResults(currentPage, keyword);
    if (addressModel.results?.juso == null) {
      return [];
    }
    List result = [];
    result.add(
        addressModel.results!.juso?.map((e) => e.toAddressItem()).toList());
    result.add(
        int.parse(addressModel.results!.common!.toAddressCount().totalCnt));

    return result;
  }
}
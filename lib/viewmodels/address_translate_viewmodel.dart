import 'dart:async';

import 'package:name_address_translator/models/model/address_translate_model.dart';
import 'package:name_address_translator/models/repository/address_translate_repository_impl.dart';

class AddressTranslateViewmodel {
  List _searchResults = [];
  List<AddressItemModel> _addressResults = [];
  int currentPage = 1;
  int _totalCount = 0;
  int _totalPage = 0;
  final _loadingController = StreamController<bool>();

  List get searchResults => _searchResults;

  List<AddressItemModel> get addressResults => _addressResults;

  int get totalCount => _totalCount;

  int get totalPage => _totalPage;

  Stream<bool> get loadingController => _loadingController.stream;

  final _repository = AddressTranslateItemsRepositoryImpl();

  Future<void> getJusoInfoResult(int currentPage, String keyword) async {
    //화면갱신
    _loadingController.add(true);
    _searchResults =
        await _repository.getAddressTranslates(currentPage, keyword);
    _addressResults = _searchResults[0];
    _totalCount = _searchResults[1];
    _totalPage = _totalCount ~/ 20 + 1;

    //다시 화면갱신
    _loadingController.add(false);
  }
}

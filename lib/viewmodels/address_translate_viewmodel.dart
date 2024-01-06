import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:name_address_translator/models/model/address_translate_model.dart';

import '../models/repository/address_translate_repository.dart';

class AddressTranslateViewmodel extends ChangeNotifier {
  final AddressTranslateItemsRepository _repository;

  AddressTranslateViewmodel({
    required AddressTranslateItemsRepository repository,
  }) : _repository = repository;

  List _searchResults = [];
  List<AddressItemModel> _addressResults = [];
  int currentPage = 1;
  int _totalCount = 0;
  int _totalPage = 0;
  bool _isLoading = false;

  List get searchResults => _searchResults;

  List<AddressItemModel> get addressResults => _addressResults;

  int get totalCount => _totalCount;

  int get totalPage => _totalPage;

  bool get isLoading => _isLoading;

  Future<void> getJusoInfoResult(int currentPage, String keyword) async {
    //화면갱신

    _isLoading = true;
    notifyListeners();

    _searchResults =
        await _repository.getAddressTranslates(currentPage, keyword);
    _addressResults = _searchResults[0];
    _totalCount = _searchResults[1];
    _totalPage = _totalCount ~/ 20 + 1;

    //다시 화면갱신
    _isLoading = false;
    notifyListeners();
  }
}

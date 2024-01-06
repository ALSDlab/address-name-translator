import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:name_address_translator/models/model/name_translate_model.dart';
import 'package:name_address_translator/models/repository/name_translate_repository.dart';

class NameTranslateViewmodel extends ChangeNotifier{
  final NameTranslateItemsRepository _repository;

  NameTranslateViewmodel({
    required NameTranslateItemsRepository repository,
  }) : _repository = repository;

  List<NameItemModel> _nameResults = [];
  bool _isLoading = false;


  List<NameItemModel> get nameResults => _nameResults;
  bool get isLoading => _isLoading;




  Future<void> getNameInfoResult(String korName) async {
    //화면갱신

    _isLoading = true;
    notifyListeners();

    _nameResults = (await _repository.getNameTranslates(korName))!;

    //다시 화면갱신
    _isLoading = false;
    notifyListeners();
  }

}

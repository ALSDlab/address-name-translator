import 'dart:async';

import 'package:name_address_translator/models/model/name_translate_model.dart';
import 'package:name_address_translator/models/repository/name_translate_repository.dart';

class NameTranslateViewmodel {
  List<NameItemModel> _nameResults = [];
  final _loadingController = StreamController<bool>();

  List<NameItemModel> get nameResults => _nameResults;

  Stream<bool> get loadingController => _loadingController.stream;

  final _repository = NameTranslateItemsRepository();

  Future<void> getNameInfoResult(String korName) async {
    //화면갱신
    _loadingController.add(true);
    _nameResults = (await _repository.getNameTranslates(korName))!;

    //다시 화면갱신
    _loadingController.add(false);
  }
}

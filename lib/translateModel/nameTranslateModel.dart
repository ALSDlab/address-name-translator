class NameTranslateDetail{

  List<LoadedData> aResult;

//<editor-fold desc="Data Methods">
  NameTranslateDetail({
    required this.aResult,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NameTranslateDetail &&
          runtimeType == other.runtimeType &&
          aResult == other.aResult);

  @override
  int get hashCode => aResult.hashCode;

  @override
  String toString() {
    return 'NameTranslateDetail{ aResult: $aResult,}';
  }

  NameTranslateDetail copyWith({
    List<LoadedData>? aResult,
  }) {
    return NameTranslateDetail(
      aResult: aResult ?? this.aResult,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'aResult': aResult,
    };
  }

  factory NameTranslateDetail.fromJson(Map<String, dynamic> map) {
    return NameTranslateDetail(
      aResult: map['aResult'] as List<LoadedData>,
    );
  }

//</editor-fold>
}



class LoadedData {
  String sFirstName;
  List<NameResults> aItems;

//<editor-fold desc="Data Methods">
  LoadedData({
    required this.sFirstName,
    required this.aItems,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoadedData &&
          runtimeType == other.runtimeType &&
          sFirstName == other.sFirstName &&
          aItems == other.aItems);

  @override
  int get hashCode => sFirstName.hashCode ^ aItems.hashCode;

  @override
  String toString() {
    return 'LoadedData{ sFirstName: $sFirstName, aItems: $aItems,}';
  }

  LoadedData copyWith({
    String? sFirstName,
    List<NameResults>? aItems,
  }) {
    return LoadedData(
      sFirstName: sFirstName ?? this.sFirstName,
      aItems: aItems ?? this.aItems,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sFirstName': sFirstName,
      'aItems': aItems,
    };
  }

  factory LoadedData.fromJson(Map<String, dynamic> map) {
    return LoadedData(
      sFirstName: map['sFirstName'] as String,
      aItems: map['aItems'] as List<NameResults>,
    );
  }

//</editor-fold>
}

class NameResults {
  String name;
  String score;

//<editor-fold desc="Data Methods">
  NameResults({
    required this.name,
    required this.score,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NameResults &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          score == other.score);

  @override
  int get hashCode => name.hashCode ^ score.hashCode;

  @override
  String toString() {
    return 'NameResults{ name: $name, score: $score,}';
  }

  NameResults copyWith({
    String? name,
    String? score,
  }) {
    return NameResults(
      name: name ?? this.name,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toJSon() {
    return {
      'name': name,
      'score': score,
    };
  }

  factory NameResults.fromJson(Map<String, dynamic> map) {
    return NameResults(
      name: map['name'] as String,
      score: map['score'] as String,
    );
  }

//</editor-fold>
}
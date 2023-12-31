class NameTranslateDetail {
  List<LoadedData>? aResult;

  NameTranslateDetail({
    required this.aResult,
  });

  NameTranslateDetail.fromJson(Map<String, dynamic> json) {
    if (json['aResult'] != null) {
      aResult = <LoadedData>[];
      json['aResult'].forEach((v) {
        aResult!.add(LoadedData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (aResult != null) {
      data['juso'] = aResult!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LoadedData {
  String? sFirstName;
  List<NameResults>? aItems;

  LoadedData({
    required this.sFirstName,
    required this.aItems,
  });

  LoadedData.fromJson(Map<String, dynamic> json) {
    sFirstName = json['sFirstName'];
    if (json['aItems'] != null) {
      aItems = <NameResults>[];
      json['aItems'].forEach((v) {
        aItems!.add(NameResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sFirstName'] = sFirstName;

    if (aItems != null) {
      data['aItems'] = aItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NameResults {
  String? name;
  String? score;

  NameResults({
    required this.name,
    required this.score,
  });

  NameResults.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['score'] = score;
    return data;
  }
}

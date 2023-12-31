class FavoriteData {
  String firstString;
  String secondString;

//<editor-fold desc="Data Methods">
  FavoriteData({
    required this.firstString,
    required this.secondString,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteData &&
          runtimeType == other.runtimeType &&
          firstString == other.firstString &&
          secondString == other.secondString);

  @override
  int get hashCode => firstString.hashCode ^ secondString.hashCode;

  @override
  String toString() {
    return 'FavoriteData{ firstString: $firstString, secondString: $secondString,}';
  }

  FavoriteData copyWith({
    String? firstString,
    String? secondString,
  }) {
    return FavoriteData(
      firstString: firstString ?? this.firstString,
      secondString: secondString ?? this.secondString,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstString': firstString,
      'secondString': secondString,
    };
  }

  factory FavoriteData.fromJson(Map<String, dynamic> map) {
    return FavoriteData(
      firstString: map['firstString'] as String,
      secondString: map['secondString'] as String,
    );
  }

//</editor-fold>
}

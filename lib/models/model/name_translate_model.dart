class NameItemModel {
  String engName;
  String accuracy;

//<editor-fold desc="Data Methods">
  NameItemModel({
    required this.engName,
    required this.accuracy,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NameItemModel &&
          runtimeType == other.runtimeType &&
          engName == other.engName &&
          accuracy == other.accuracy);

  @override
  int get hashCode => engName.hashCode ^ accuracy.hashCode;

  @override
  String toString() {
    return 'NameItemModel{ engName: $engName, accuracy: $accuracy,}';
  }

  NameItemModel copyWith({
    String? engName,
    String? accuracy,
  }) {
    return NameItemModel(
      engName: engName ?? this.engName,
      accuracy: accuracy ?? this.accuracy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'engName': engName,
      'accuracy': accuracy,
    };
  }

  factory NameItemModel.fromMap(Map<String, dynamic> map) {
    return NameItemModel(
      engName: map['engName'] as String,
      accuracy: map['accuracy'] as String,
    );
  }

//</editor-fold>
}

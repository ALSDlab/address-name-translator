class AddressItemModel {
  String zipNumber;
  String engAddr;
  String korAddr;

//<editor-fold desc="Data Methods">
  AddressItemModel({
    required this.zipNumber,
    required this.engAddr,
    required this.korAddr,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddressItemModel &&
          runtimeType == other.runtimeType &&
          zipNumber == other.zipNumber &&
          engAddr == other.engAddr &&
          korAddr == other.korAddr);

  @override
  int get hashCode => zipNumber.hashCode ^ engAddr.hashCode ^ korAddr.hashCode;

  @override
  String toString() {
    return 'AddressItemModel{ zipNumber: $zipNumber, engAddr: $engAddr, korAddr: $korAddr,}';
  }

  AddressItemModel copyWith({
    String? zipNumber,
    String? engAddr,
    String? korAddr,
  }) {
    return AddressItemModel(
      zipNumber: zipNumber ?? this.zipNumber,
      engAddr: engAddr ?? this.engAddr,
      korAddr: korAddr ?? this.korAddr,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'zipNumber': zipNumber,
      'engAddr': engAddr,
      'korAddr': korAddr,
    };
  }

  factory AddressItemModel.fromJson(Map<String, dynamic> map) {
    return AddressItemModel(
      zipNumber: map['zipNumber'] as String,
      engAddr: map['engAddr'] as String,
      korAddr: map['korAddr'] as String,
    );
  }

//</editor-fold>
}

class AddressCountModel {
  String totalCnt;

//<editor-fold desc="Data Methods">
  AddressCountModel({
    required this.totalCnt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddressCountModel &&
          runtimeType == other.runtimeType &&
          totalCnt == other.totalCnt);

  @override
  int get hashCode => totalCnt.hashCode;

  @override
  String toString() {
    return 'AddressCountModel{ totalCnt: $totalCnt,}';
  }

  AddressCountModel copyWith({
    String? totalCnt,
  }) {
    return AddressCountModel(
      totalCnt: totalCnt ?? this.totalCnt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalCnt': totalCnt,
    };
  }

  factory AddressCountModel.fromMap(Map<String, dynamic> map) {
    return AddressCountModel(
      totalCnt: map['totalCnt'] as String,
    );
  }

//</editor-fold>
}

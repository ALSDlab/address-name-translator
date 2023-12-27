class TranslateDetail {
  ResultCommon common;
  List<JusoDetail> juso;

//<editor-fold desc="Data Methods">
  TranslateDetail({
    required this.common,
    required this.juso,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TranslateDetail &&
          runtimeType == other.runtimeType &&
          common == other.common &&
          juso == other.juso);

  @override
  int get hashCode => common.hashCode ^ juso.hashCode;

  @override
  String toString() {
    return 'TranslateDetail{ common: $common, juso: $juso,}';
  }

  TranslateDetail copyWith({
    ResultCommon? common,
    List<JusoDetail>? juso,
  }) {
    return TranslateDetail(
      common: common ?? this.common,
      juso: juso ?? this.juso,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'common': common,
      'juso': juso,
    };
  }

  factory TranslateDetail.fromJson(Map<String, dynamic> map) {
    return TranslateDetail(
      common: map['common'] as ResultCommon,
      juso: (map['juso'] as List<JusoDetail>),
    );
  }

//</editor-fold>
}

class ResultCommon {
  String errorMessage;
  String countPerPage;
  String totalCount;
  String errorCode;
  String currentPage;

//<editor-fold desc="Data Methods">
  ResultCommon({
    required this.errorMessage,
    required this.countPerPage,
    required this.totalCount,
    required this.errorCode,
    required this.currentPage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ResultCommon &&
          runtimeType == other.runtimeType &&
          errorMessage == other.errorMessage &&
          countPerPage == other.countPerPage &&
          totalCount == other.totalCount &&
          errorCode == other.errorCode &&
          currentPage == other.currentPage);

  @override
  int get hashCode =>
      errorMessage.hashCode ^
      countPerPage.hashCode ^
      totalCount.hashCode ^
      errorCode.hashCode ^
      currentPage.hashCode;

  @override
  String toString() {
    return 'resultCommon{ errorMessage: $errorMessage, countPerPage: $countPerPage, totalCount: $totalCount, errorCode: $errorCode, currentPage: $currentPage,}';
  }

  ResultCommon copyWith({
    String? errorMessage,
    String? countPerPage,
    String? totalCount,
    String? errorCode,
    String? currentPage,
  }) {
    return ResultCommon(
      errorMessage: errorMessage ?? this.errorMessage,
      countPerPage: countPerPage ?? this.countPerPage,
      totalCount: totalCount ?? this.totalCount,
      errorCode: errorCode ?? this.errorCode,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'errorMessage': errorMessage,
      'countPerPage': countPerPage,
      'totalCount': totalCount,
      'errorCode': errorCode,
      'currentPage': currentPage,
    };
  }

  factory ResultCommon.fromJson(Map<String, dynamic> map) {
    return ResultCommon(
      errorMessage: map['errorMessage'] as String,
      countPerPage: map['countPerPage'] as String,
      totalCount: map['totalCount'] as String,
      errorCode: map['errorCode'] as String,
      currentPage: map['currentPage'] as String,
    );
  }

//</editor-fold>

}

class JusoDetail {
  String zipNo;
  String emdNm;
  String rn;
  String jibunAddr;
  String siNm;
  String sggNm;
  String admCd;
  String udrtYn;
  String lnbrMnnm;
  String roadAddr;
  String korAddr;
  String lnbrSlno;
  String buldMnnm;
  String bdKdcd;
  String rnMgtSn;
  String liNm;
  String mtYn;
  String buldSlno;

//<editor-fold desc="Data Methods">
  JusoDetail({
    required this.zipNo,
    required this.emdNm,
    required this.rn,
    required this.jibunAddr,
    required this.siNm,
    required this.sggNm,
    required this.admCd,
    required this.udrtYn,
    required this.lnbrMnnm,
    required this.roadAddr,
    required this.korAddr,
    required this.lnbrSlno,
    required this.buldMnnm,
    required this.bdKdcd,
    required this.rnMgtSn,
    required this.liNm,
    required this.mtYn,
    required this.buldSlno,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JusoDetail &&
          runtimeType == other.runtimeType &&
          zipNo == other.zipNo &&
          emdNm == other.emdNm &&
          rn == other.rn &&
          jibunAddr == other.jibunAddr &&
          siNm == other.siNm &&
          sggNm == other.sggNm &&
          admCd == other.admCd &&
          udrtYn == other.udrtYn &&
          lnbrMnnm == other.lnbrMnnm &&
          roadAddr == other.roadAddr &&
          korAddr == other.korAddr &&
          lnbrSlno == other.lnbrSlno &&
          buldMnnm == other.buldMnnm &&
          bdKdcd == other.bdKdcd &&
          rnMgtSn == other.rnMgtSn &&
          liNm == other.liNm &&
          mtYn == other.mtYn &&
          buldSlno == other.buldSlno);

  @override
  int get hashCode =>
      zipNo.hashCode ^
      emdNm.hashCode ^
      rn.hashCode ^
      jibunAddr.hashCode ^
      siNm.hashCode ^
      sggNm.hashCode ^
      admCd.hashCode ^
      udrtYn.hashCode ^
      lnbrMnnm.hashCode ^
      roadAddr.hashCode ^
      korAddr.hashCode ^
      lnbrSlno.hashCode ^
      buldMnnm.hashCode ^
      bdKdcd.hashCode ^
      rnMgtSn.hashCode ^
      liNm.hashCode ^
      mtYn.hashCode ^
      buldSlno.hashCode;

  @override
  String toString() {
    return 'JusoDetail{ zipNo: $zipNo, emdNm: $emdNm, rn: $rn, jibunAddr: $jibunAddr, siNm: $siNm, sggNm: $sggNm, admCd: $admCd, udrtYn: $udrtYn, lnbrMnnm: $lnbrMnnm, roadAddr: $roadAddr, korAddr: $korAddr, lnbrSlno: $lnbrSlno, buldMnnm: $buldMnnm, bdKdcd: $bdKdcd, rnMgtSn: $rnMgtSn, liNm: $liNm, mtYn: $mtYn, buldSlno: $buldSlno,}';
  }

  JusoDetail copyWith({
    String? zipNo,
    String? emdNm,
    String? rn,
    String? jibunAddr,
    String? siNm,
    String? sggNm,
    String? admCd,
    String? udrtYn,
    String? lnbrMnnm,
    String? roadAddr,
    String? korAddr,
    String? lnbrSlno,
    String? buldMnnm,
    String? bdKdcd,
    String? rnMgtSn,
    String? liNm,
    String? mtYn,
    String? buldSlno,
  }) {
    return JusoDetail(
      zipNo: zipNo ?? this.zipNo,
      emdNm: emdNm ?? this.emdNm,
      rn: rn ?? this.rn,
      jibunAddr: jibunAddr ?? this.jibunAddr,
      siNm: siNm ?? this.siNm,
      sggNm: sggNm ?? this.sggNm,
      admCd: admCd ?? this.admCd,
      udrtYn: udrtYn ?? this.udrtYn,
      lnbrMnnm: lnbrMnnm ?? this.lnbrMnnm,
      roadAddr: roadAddr ?? this.roadAddr,
      korAddr: korAddr ?? this.korAddr,
      lnbrSlno: lnbrSlno ?? this.lnbrSlno,
      buldMnnm: buldMnnm ?? this.buldMnnm,
      bdKdcd: bdKdcd ?? this.bdKdcd,
      rnMgtSn: rnMgtSn ?? this.rnMgtSn,
      liNm: liNm ?? this.liNm,
      mtYn: mtYn ?? this.mtYn,
      buldSlno: buldSlno ?? this.buldSlno,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'zipNo': zipNo,
      'emdNm': emdNm,
      'rn': rn,
      'jibunAddr': jibunAddr,
      'siNm': siNm,
      'sggNm': sggNm,
      'admCd': admCd,
      'udrtYn': udrtYn,
      'lnbrMnnm': lnbrMnnm,
      'roadAddr': roadAddr,
      'korAddr': korAddr,
      'lnbrSlno': lnbrSlno,
      'buldMnnm': buldMnnm,
      'bdKdcd': bdKdcd,
      'rnMgtSn': rnMgtSn,
      'liNm': liNm,
      'mtYn': mtYn,
      'buldSlno': buldSlno,
    };
  }

  factory JusoDetail.fromJson(Map<String, dynamic> map) {
    return JusoDetail(
      zipNo: map['zipNo'] as String,
      emdNm: map['emdNm'] as String,
      rn: map['rn'] as String,
      jibunAddr: map['jibunAddr'] as String,
      siNm: map['siNm'] as String,
      sggNm: map['sggNm'] as String,
      admCd: map['admCd'] as String,
      udrtYn: map['udrtYn'] as String,
      lnbrMnnm: map['lnbrMnnm'] as String,
      roadAddr: map['roadAddr'] as String,
      korAddr: map['korAddr'] as String,
      lnbrSlno: map['lnbrSlno'] as String,
      buldMnnm: map['buldMnnm'] as String,
      bdKdcd: map['bdKdcd'] as String,
      rnMgtSn: map['rnMgtSn'] as String,
      liNm: map['liNm'] as String,
      mtYn: map['mtYn'] as String,
      buldSlno: map['buldSlno'] as String,
    );
  }

//</editor-fold>
  String get formattedAddress => '$roadAddr, $emdNm';
}

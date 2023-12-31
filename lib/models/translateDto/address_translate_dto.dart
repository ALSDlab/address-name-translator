class AddressTranslateDto {
  Results? results;

  AddressTranslateDto({this.results});

  AddressTranslateDto.fromJson(Map<String, dynamic> json) {
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.toJson();
    }
    return data;
  }
}

class Results {
  Common? common;
  List<Juso>? juso;

  Results({this.common, this.juso});

  Results.fromJson(Map<String, dynamic> json) {
    common =
        json['common'] != null ? Common.fromJson(json['common']) : null;
    if (json['juso'] != null) {
      juso = <Juso>[];
      json['juso'].forEach((v) {
        juso!.add(Juso.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (common != null) {
      data['common'] = common!.toJson();
    }
    if (juso != null) {
      data['juso'] = juso!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Common {
  String? errorMessage;
  String? countPerPage;
  String? totalCount;
  String? errorCode;
  String? currentPage;

  Common(
      {this.errorMessage,
      this.countPerPage,
      this.totalCount,
      this.errorCode,
      this.currentPage});

  Common.fromJson(Map<String, dynamic> json) {
    errorMessage = json['errorMessage'];
    countPerPage = json['countPerPage'];
    totalCount = json['totalCount'];
    errorCode = json['errorCode'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorMessage'] = errorMessage;
    data['countPerPage'] = countPerPage;
    data['totalCount'] = totalCount;
    data['errorCode'] = errorCode;
    data['currentPage'] = currentPage;
    return data;
  }
}

class Juso {
  String? zipNo;
  String? emdNm;
  String? rn;
  String? jibunAddr;
  String? siNm;
  String? sggNm;
  String? admCd;
  String? udrtYn;
  String? lnbrMnnm;
  String? roadAddr;
  String? korAddr;
  String? lnbrSlno;
  String? buldMnnm;
  String? bdKdcd;
  String? rnMgtSn;
  String? liNm;
  String? mtYn;
  String? buldSlno;

  Juso(
      {this.zipNo,
      this.emdNm,
      this.rn,
      this.jibunAddr,
      this.siNm,
      this.sggNm,
      this.admCd,
      this.udrtYn,
      this.lnbrMnnm,
      this.roadAddr,
      this.korAddr,
      this.lnbrSlno,
      this.buldMnnm,
      this.bdKdcd,
      this.rnMgtSn,
      this.liNm,
      this.mtYn,
      this.buldSlno});

  Juso.fromJson(Map<String, dynamic> json) {
    zipNo = json['zipNo'];
    emdNm = json['emdNm'];
    rn = json['rn'];
    jibunAddr = json['jibunAddr'];
    siNm = json['siNm'];
    sggNm = json['sggNm'];
    admCd = json['admCd'];
    udrtYn = json['udrtYn'];
    lnbrMnnm = json['lnbrMnnm'];
    roadAddr = json['roadAddr'];
    korAddr = json['korAddr'];
    lnbrSlno = json['lnbrSlno'];
    buldMnnm = json['buldMnnm'];
    bdKdcd = json['bdKdcd'];
    rnMgtSn = json['rnMgtSn'];
    liNm = json['liNm'];
    mtYn = json['mtYn'];
    buldSlno = json['buldSlno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['zipNo'] = zipNo;
    data['emdNm'] = emdNm;
    data['rn'] = rn;
    data['jibunAddr'] = jibunAddr;
    data['siNm'] = siNm;
    data['sggNm'] = sggNm;
    data['admCd'] = admCd;
    data['udrtYn'] = udrtYn;
    data['lnbrMnnm'] = lnbrMnnm;
    data['roadAddr'] = roadAddr;
    data['korAddr'] = korAddr;
    data['lnbrSlno'] = lnbrSlno;
    data['buldMnnm'] = buldMnnm;
    data['bdKdcd'] = bdKdcd;
    data['rnMgtSn'] = rnMgtSn;
    data['liNm'] = liNm;
    data['mtYn'] = mtYn;
    data['buldSlno'] = buldSlno;
    return data;
  }
}

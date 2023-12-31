import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:name_address_translator/models/translateDto/name_translate_dto.dart';

class NameTranslateApi {
  Future<NameTranslateDetail> getNameInfoResult(String koreanName) async {
    const String apiUrl =
        'https://naveropenapi.apigw.ntruss.com/krdict/v1/romanization';
    const String clientId = 'rwqrupk9k8';
    const String clientSecret = 'tKEABJyJYvBPFVW8FIKIRnrY9arJGAjK7i8pzPNc';

    try {
      final String keyword = Uri.encodeFull(koreanName);
      final http.Response response = await http.get(
        Uri.parse('$apiUrl?query=$keyword'),
        headers: {
          'X-NCP-APIGW-API-KEY-ID': clientId,
          'X-NCP-APIGW-API-KEY': clientSecret,
        },
      );

      if (response.statusCode == 200) {
        // HTTP 응답이 성공인 경우에만 JSON 디코딩 및 타입 캐스팅 수행
        return NameTranslateDetail.fromJson(json.decode(response.body));
      } else {
        throw Exception(
            'Failed to load name results, status code: ${response.statusCode}');
      }
    } catch (e) {
      // 예외 처리를 통해 HTTP 요청 및 JSON 디코딩 중 발생하는 예외 처리
      print('Error in getAddressResults: $e');
      rethrow; // 현재 예외를 다시 던져서 상위 수준에서도 예외를 처리할 수 있도록 함
    }
  }
}

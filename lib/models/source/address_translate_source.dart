import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:name_address_translator/models/translateDto/address_translate_dto.dart';

class AddressTranslateApi {
  Future<AddressTranslateDto> getAddressResults(
      int currentPage, String keyword) async {
    try {
      final response = await http.get(Uri.parse(
          'https://business.juso.go.kr/addrlink/addrEngApi.do?currentPage=$currentPage&countPerPage=20&keyword=${Uri.encodeFull(keyword)}&confmKey=U01TX0FVVEgyMDIzMTIyNjIzNTUzMTExNDM4NTc=&resultType=json'));
      if (response.statusCode == 200) {
        // HTTP 응답이 성공인 경우에만 JSON 디코딩 및 타입 캐스팅 수행
        return AddressTranslateDto.fromJson(
            json.decode(utf8.decode(response.bodyBytes)));
      } else {
        // HTTP 응답이 성공하지 않은 경우에 대한 예외 처리
        throw Exception(
            'Failed to load address results, status code: ${response.statusCode}');
      }
    } catch (e) {
      // 예외 처리를 통해 HTTP 요청 및 JSON 디코딩 중 발생하는 예외 처리
      print('Error in getAddressResults: $e');
      rethrow; // 현재 예외를 다시 던져서 상위 수준에서도 예외를 처리할 수 있도록 함
    }
  }
}

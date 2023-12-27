import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:name_address_translator/translateModel/translateModel.dart';
import 'package:name_address_translator/widgets/AddressResultCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressTranslateScreen extends StatefulWidget {
  const AddressTranslateScreen({super.key});

  @override
  State<AddressTranslateScreen> createState() => _AddressTranslateScreen();
}

class _AddressTranslateScreen extends State<AddressTranslateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  List<JusoDetail> _addressResults = [];
  int currentPage = 1;
  int _totalCount = 0;
  int _totalPage = 0;

  Future<void> getJusoInfoResult(int currentPage, String keyword) async {
    final response = await http.get(Uri.parse(
        'https://business.juso.go.kr/addrlink/addrEngApi.do?currentPage=$currentPage&countPerPage=20&keyword=${Uri.encodeFull(keyword)}&confmKey=U01TX0FVVEgyMDIzMTIyNjIzNTUzMTExNDM4NTc=&resultType=json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> jusoList = data['results']['juso'];
      final totalCount = int.parse(data['results']['common']['totalCount']);
      List<JusoDetail> results = [];
      for (var jusoData in jusoList) {
        results.add(JusoDetail.fromJson(jusoData));
      }
      setState(() {
        _addressResults = results;
        _totalCount = totalCount;
        _totalPage = totalCount ~/ 20 + 1;
      });
    } else {
      throw Exception('Failed to load address results');
    }
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  Future save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('address', _addressController.text);
  }

  Future load() async {
    final prefs = await SharedPreferences.getInstance();
    final String? address = prefs.getString('address');

    if (address != null) {
      _addressController.text = address;
      // print('국문주소: $address');
      // print(Uri.encodeFull(address));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: const Color(0xff19ddcb),
        leadingWidth: 200,
        leading: const Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            '주소변환',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontFamily: 'Dohyeon'),
          ),
        ),
      ),
      body: Stack(
        children: [
          const Opacity(
            opacity: 0.1,
            child: Center(
              child: Icon(Icons.maps_home_work_rounded, size: 300),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      TextFormField(
                        controller: _addressController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          hintText: '주소',
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '주소를 입력하세요';
                          }
                          return null;
                        },
                        style: const TextStyle(
                          fontFamily: 'Dohyeon',
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: IconButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() == false) {
                              return;
                            }
                            save();
                            final String keyword = _addressController.text;
                            getJusoInfoResult(currentPage, keyword);
                          },
                          icon: const Icon(
                            Icons.search_rounded,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 8,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _addressResults.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        height: 0.5,
                        color: Colors.grey,
                      ),
                      itemBuilder: (context, index) {
                        final addressResult = _addressResults[index];
                        return AddressResultCard(result: addressResult);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '검색결과: $_totalCount',
                      style: const TextStyle(fontFamily: 'Dohyeon'),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: _totalPage,
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {
                            final String keyword = _addressController.text;
                            getJusoInfoResult(index + 1, keyword);
                          },
                          child: Text('${index + 1}',
                              style: const TextStyle(
                                  fontSize: 18, fontFamily: 'Dohyeon')),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

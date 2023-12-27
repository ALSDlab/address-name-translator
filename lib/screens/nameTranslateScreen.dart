import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:name_address_translator/translateModel/nameTranslateModel.dart';
import 'package:name_address_translator/widgets/nameResultCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameTranslateScreen extends StatefulWidget {
  const NameTranslateScreen({super.key});

  @override
  State<NameTranslateScreen> createState() => _NameTranslateScreen();
}

class _NameTranslateScreen extends State<NameTranslateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  List<NameResults> _nameResults = [];

  final String clientId = 'rwqrupk9k8';
  final String clientSecret = 'tKEABJyJYvBPFVW8FIKIRnrY9arJGAjK7i8pzPNc';

  Future<void> getNameInfoResult(String koreanName) async {
    const String apiUrl = 'https://naveropenapi.apigw.ntruss.com/krdict/v1/romanization';
    final String keyword = Uri.encodeFull(koreanName);
    final http.Response response = await http.get(
      Uri.parse('$apiUrl?query=$keyword'),
      headers: {
        'X-NCP-APIGW-API-KEY-ID': clientId,
        'X-NCP-APIGW-API-KEY': clientSecret,
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> nameList = data['aResult'][0]['aItems'];
      print(nameList);
      List<NameResults> results = [];
      for (var nameData in nameList) {
        results.add(NameResults.fromJson(nameData));
      }
      setState(() {
        _nameResults = results;
      });
    } else {
      throw Exception('Failed to load name results');
    }
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
  }

  Future load() async {
    final prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('name');

    if (name != null) {
      _nameController.text = name;
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
            '이름변환',
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
              child: Icon(Icons.person, size: 300),
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
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          hintText: '이름',
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '이름을 입력하세요';
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
                            final String keyword = _nameController.text;
                            getNameInfoResult(keyword);
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
                      itemCount: _nameResults.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        height: 0.5,
                        color: Colors.grey,
                      ),
                      itemBuilder: (context, index) {
                        final nameResult = _nameResults[index];
                        return NameResultCard(result: nameResult);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '검색결과: ${_nameResults.length}',
                      style: const TextStyle(fontFamily: 'Dohyeon'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

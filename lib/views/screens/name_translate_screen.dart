import 'package:flutter/material.dart';
import 'package:name_address_translator/viewmodels/name_translate_viewmodel.dart';
import 'package:name_address_translator/views/widgets/name_result_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameTranslateScreen extends StatefulWidget {
  const NameTranslateScreen({super.key});

  @override
  State<NameTranslateScreen> createState() => _NameTranslateScreen();
}

class _NameTranslateScreen extends State<NameTranslateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final viewModel = NameTranslateViewmodel();

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
                            viewModel.getNameInfoResult(keyword);
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
                    child: StreamBuilder<bool>(
                      initialData: false,
                      stream: viewModel.loadingController,
                      builder: (context, snapshot) {
                        if (snapshot.data == true) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemCount: viewModel.nameResults.length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(
                                  height: 0.5,
                                  color: Colors.grey,
                                ),
                                itemBuilder: (context, index) {
                                  final nameResult =
                                      viewModel.nameResults[index];
                                  return NameResultCard(result: nameResult);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                '검색결과: ${viewModel.nameResults.length}',
                                style: const TextStyle(fontFamily: 'Dohyeon'),
                              ),
                            ),
                          ],
                        );
                      },
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

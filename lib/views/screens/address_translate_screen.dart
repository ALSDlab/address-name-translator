import 'package:flutter/material.dart';
import 'package:name_address_translator/viewmodels/address_translate_viewmodel.dart';
import 'package:name_address_translator/views/widgets/address_result_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressTranslateScreen extends StatefulWidget {
  const AddressTranslateScreen({super.key});

  @override
  State<AddressTranslateScreen> createState() => _AddressTranslateScreen();
}

class _AddressTranslateScreen extends State<AddressTranslateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();

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
    final addrViewModel = context.watch<AddressTranslateViewmodel>();
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
                            addrViewModel.getJusoInfoResult(1, keyword);
                          },
                          icon: const Icon(
                            Icons.search_rounded,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  addrViewModel.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount:
                                      addrViewModel.addressResults.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const Divider(
                                    height: 0.5,
                                    color: Colors.grey,
                                  ),
                                  itemBuilder: (context, index) {
                                    final addressResult =
                                        addrViewModel.addressResults[index];
                                    return AddressResultCard(
                                        result: addressResult);
                                  },
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: addrViewModel.totalPage,
                                  itemBuilder: (context, index) {
                                    return TextButton(
                                      onPressed: () {
                                        final String keyword =
                                            _addressController.text;
                                        addrViewModel.getJusoInfoResult(
                                            index + 1, keyword);
                                      },
                                      child: Text('${index + 1}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Dohyeon')),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  '검색결과: ${addrViewModel.totalCount}',
                                  style: const TextStyle(fontFamily: 'Dohyeon'),
                                ),
                              ),
                            ],
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

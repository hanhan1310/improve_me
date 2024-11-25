import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:improve_me/config/theme/theme.dart';
import 'package:improve_me/controller/language_controller/language_controller.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final LanguageController _languageController = Get.put(LanguageController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _languageController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Improve Me",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffA3EAFF),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Get.changeTheme(
                    Get.isDarkMode ? ThemeApp.light : ThemeApp.dark);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "theme".tr,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Get.dialog(AlertDialog(
                    title: Center(child: Text("selectLanguage".tr)),
                    content: Container(
                      width: double.infinity,
                      height: 80,
                      child: ListView.separated(
                        itemCount: _languageController.changeLanguage.length,
                        itemBuilder: (context, index) {
                          final currentLanguageValue =
                              _languageController.changeLanguage[index]['name'];
                          final currentLocalValue = _languageController
                              .changeLanguage[index]['local'];
                          return Center(
                            child: InkWell(
                              child: Text(currentLanguageValue.toString().toLowerCase().tr, style: TextStyle(fontSize: 16),),
                              onTap: () {
                                Get.back();
                                Get.updateLocale(currentLocalValue);
                              },
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                      ),
                    ),
                  ));
                },
                child: Text(
                  "language".tr,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

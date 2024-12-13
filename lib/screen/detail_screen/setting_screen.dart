import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:improve_me/config/common_widget/text_widget/title_text_widget.dart';
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
        title: Text(
          "Improve Me",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                child: Center(
                  child: TitleTextWidget(data: "theme"),
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
                              child: Text(
                                currentLanguageValue
                                    .toString()
                                    .toLowerCase()
                                    .tr,
                                style: TextStyle(fontSize: 16),
                              ),
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

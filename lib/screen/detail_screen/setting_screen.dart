import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:improve_me/config/common_widget/button_widget/button_widget.dart';
import 'package:improve_me/config/common_widget/text_widget/title_small_widget.dart';
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
              child: ButtonWidget(
                data: "theme",
                onPressed: () {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeApp.light : ThemeApp.dark);
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // SizedBox(
            //   width: 300,
            //   height: 60,
            //   child: ButtonWidget(
            //     data: "language",
            //     onPressed: () {
            //       Get.dialog(
            //         AlertDialog(
            //           title: Center(child: Text("selectLanguage".tr)),
            //           content: Container(
            //             width: double.infinity,
            //             height: 80,
            //             child: ListView.separated(
            //               itemCount: _languageController.changeLanguage.length,
            //               itemBuilder: (context, index) {
            //                 final currentLanguageValue = _languageController
            //                     .changeLanguage[index]['name'];
            //                 final currentLocalValue = _languageController
            //                     .changeLanguage[index]['local'];
            //                 return Center(
            //                   child: InkWell(
            //                     child: Text(
            //                       currentLanguageValue
            //                           .toString()
            //                           .toLowerCase()
            //                           .tr,
            //                       style: TextStyle(fontSize: 16),
            //                     ),
            //                     onTap: () {
            //                       Get.back();
            //                       Get.updateLocale(currentLocalValue);
            //                     },
            //                   ),
            //                 );
            //               },
            //               separatorBuilder: (BuildContext context, int index) {
            //                 return Divider();
            //               },
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

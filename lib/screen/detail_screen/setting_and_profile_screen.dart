

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:improve_me/screen/detail_screen/profile_screen.dart';
import 'package:improve_me/screen/detail_screen/setting_screen.dart';

import '../../common_module/authentication/log_in/login_screen.dart';
import '../../config/common_widget/button_widget/button_widget.dart';
import '../../config/common_widget/text_widget/title_large_widget.dart';
import '../../controller/sign_up_controller/sign_up_controller.dart';
import '../../model/authentication_model.dart';
import '../../utils/authentication_service.dart';

class SettingAndProfileScreen extends StatefulWidget {
  const SettingAndProfileScreen({super.key});

  @override
  State<SettingAndProfileScreen> createState() => _SettingAndProfileScreenState();
}

class _SettingAndProfileScreenState extends State<SettingAndProfileScreen> {
  final AuthenticationService authenticationService = AuthenticationService();
  final SignUpController _signUpController = Get.put(SignUpController());
  late RxString dataName = "".obs;
  final RxList<AuthenticationModel> userData = <AuthenticationModel>[].obs;

  Future<void> _fetchExercises() async {
    final userId = _signUpController.currentUser?.uid;
    if (userId != null && userId.isNotEmpty) {
      authenticationService.getUserIdData(userId).listen((data) {
        if (data.isNotEmpty) {
          userData.assignAll(data);
          dataName.value = (userData.first.userName ?? "").obs.value;
          print("Dữ liệu người dùng: ${userData.first.userName ?? ""}");
        } else {
          print("Không tìm thấy dữ liệu cho user $userId");
        }
      });
    } else {
      print("User ID không hợp lệ");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authenticationService;
    _signUpController;
    _fetchExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        return Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleLargeWidget(data: "profile"),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),

                  /// avatar
                  Icon(
                    Icons.account_circle,
                    size: 80,
                  ),

                  SizedBox(
                    width: 30,
                  ),

                  /// name
                  TitleLargeWidget(data: "$dataName"),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        /// profile button
                        SizedBox(
                          height: 60,
                          width: 300,
                          child: ButtonWidget(
                            data: "editingProfile",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (const ProfileScreen()),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        /// Setting button
                        SizedBox(
                          height: 60,
                          width: 300,
                          child: ButtonWidget(
                            data: "setting",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (const SettingScreen()),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        /// log out button
                        SizedBox(
                            height: 60,
                            width: 300,
                            child: ButtonWidget(
                              data: "logout",
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        (const LoginScreen())),
                                        (route) => false);
                              },
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

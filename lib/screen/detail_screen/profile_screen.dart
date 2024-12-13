import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:improve_me/config/common_widget/text_widget/headline_widget.dart';
import 'package:improve_me/utils/authentication_service.dart';

import '../../controller/sign_up_controller/sign_up_controller.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthenticationService authenticationService = AuthenticationService();
  final SignUpController _signUpController = Get.put(SignUpController());
  final RxString dataName = "".obs;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authenticationService;
    _signUpController;
    _fetchExercises;
  }

  Future<void> _fetchExercises() async {
    final userId = _signUpController.currentUser?.uid;
    if (userId != null && userId.isNotEmpty) {
      authenticationService.getUserIdData(userId).listen((userData) {
        dataName.value = userData.toString();
      });
    } else {
      print("User ID not available");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadlineWidget(data: "profile"),
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
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          children: [
            Obx(() {
              return SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "name".tr,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text("$dataName",
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                    ],
                  ),
                ),
              );
            }
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Text("20",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "password".tr,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Text("170",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "privacyQuestion".tr,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Text("65",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),


          ],
        ),
      ),
    );
  }
}

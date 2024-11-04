import 'package:flutter/material.dart';
import 'package:improve_me/controller/sign_up_controller/sign_up_controller.dart';
import '../../../config/common_widget/button_widget.dart';
import '../../../config/common_widget/text_widget.dart';
import '../../../screen/main_screen/home_screen_exercises.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late TextEditingController userController;
  late TextEditingController passwordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userController.dispose();
    passwordController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Personal Information",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            SizedBox(
              height: 45,
              width: 270,
              child: TextFormField(
                controller: userController,
                style: TextStyle(
                    fontSize: 12
                ),
                onTapOutside: (even) {
                  FocusScope.of(context).unfocus();
                },
                autofocus: false,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Username",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffA3EAFF), width: 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            SizedBox(
              height: 45,
              width: 270,
              child: TextFormField(
                controller: passwordController,
                style: TextStyle(
                    fontSize: 12
                ),
                onTapOutside: (even) {
                  FocusScope.of(context).unfocus();
                },
                autofocus: false,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Password",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffA3EAFF), width: 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            SizedBox(
              height: 45,
              width: 270,
              child: TextWidget("Name"),
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            SizedBox(
              width: 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 125,
                    height: 45,
                    child: TextWidget("Age"),
                  ),
                  SizedBox(
                    width: 125,
                    height: 45,
                    child: TextWidget("Gender"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            SizedBox(
              width: 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 125,
                    height: 45,
                    child: TextWidget("Height"),
                  ),

                  SizedBox(
                    width: 125,
                    height: 45,
                    child: TextWidget("Weight"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
              width: double.infinity,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffA3EAFF),
                    side: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    )),
                onPressed: () {
                  SignUpController signUpController = SignUpController();
                  signUpController.createUserByEmailAndPassword(email: userController.text, password: passwordController.text );
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => (HomeScreenExercises())),
                          (route) => false);
                },
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 17, color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

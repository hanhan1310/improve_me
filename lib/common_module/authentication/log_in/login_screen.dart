import 'package:flutter/material.dart';
import '../../../config/images/image.dart';
import '../../../controller/sign_up_controller/sign_up_controller.dart';
import '../../../screen/main_screen/home_screen_exercises.dart';
import '../register/sign_up.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController userController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      // If the form is valid, process the login
      final email = userController.text.trim();
      final password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        print("Email or Password is empty.");
        return;
      }

      print('Email: $email');
      print('Password: $password');

      SignUpController signInController = SignUpController();
      signInController.signInWithEmailAndPassword(
          email: userController.text, password: passwordController.text);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => (const HomeScreenExercises())),
          (route) => false);
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    userController = TextEditingController();
    passwordController = TextEditingController();
    formKey;
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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [

              /// image
              Container(
                height: 220,
                width: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(Images.login)),
                ),
              ),

              /// text login
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "loginToYourAccount".tr,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
                width: double.infinity,
              ),

              /// username
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: userController,
                  validator: validateEmail,
                  style: const TextStyle(fontSize: 12),
                  onTapOutside: (even) {
                    FocusScope.of(context).unfocus();
                  },
                  autofocus: false,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Email",
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffA3EAFF), width: 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
                width: double.infinity,
              ),

              /// password
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: passwordController,
                  style: const TextStyle(fontSize: 12),
                  onTapOutside: (even) {
                    FocusScope.of(context).unfocus();
                  },
                  autofocus: false,
                  validator: validatePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "password".tr,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffA3EAFF), width: 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),

              /// forgot your password?
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "forgotPassword".tr,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),


              const SizedBox(
                height: 30,
              ),

              ///button sign in
              SizedBox(
                height: 45,
                width: 150,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffA3EAFF),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        )),
                    onPressed: submitForm,
                    child: Center(
                      child: Text(
                        "signIn".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black),
                      ),
                    )),
              ),

              /// sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "createAccount".tr,
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Screen1()));
                    },
                    child: Text(
                      "signUp".tr,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

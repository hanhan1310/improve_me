import 'package:flutter/material.dart';
import 'package:improve_me/controller/sign_up_controller/sign_up_controller.dart';
import 'package:improve_me/utils/authentication_service.dart';
import '../../../screen/main_screen/home_screen_exercises.dart';
import 'package:get/get.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late TextEditingController userController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController userNameController;
  late TextEditingController privacyQuestionController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthenticationService authenticationService = AuthenticationService();
  final SignUpController signUpController = SignUpController();


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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    }
    if (value.length < 6) {
      return 'Confirm Password must be at least 6 characters long';
    }
    if (value != passwordController.text) {
      return 'Check again please';
    }
    return null;
  }

  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      // If the form is valid, process the login
      final email = userController.text.trim();
      final password = passwordController.text.trim();
      final userName = userNameController.text.trim();
      final privacyQuestion = privacyQuestionController.text.trim();

      if (email.isEmpty || password.isEmpty || userName.isEmpty || privacyQuestion.isEmpty) {
        print("Please check again!");
        return;
      }

      if(confirmPasswordController.text.trim() == passwordController.text.trim()) {
        await signUpController.createUserByEmailAndPassword(
            email: userController.text,
            password: passwordController.text,
        );
        String? userID = await signUpController.currentUser?.uid ?? "";
        await authenticationService.addUser(userID, userName, email, password, privacyQuestion);
        print("${signUpController.currentUser?.uid}");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => (HomeScreenExercises())),
                (route) => false);
      } else {
        print("loi xac nhan mk");
      }
    } else {
      print("loi");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    userNameController = TextEditingController();
    privacyQuestionController = TextEditingController();
    signUpController;
    authenticationService;
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
        title: Text(
          "personalInformation".tr,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
                width: double.infinity,
              ),

              /// email
              SizedBox(
                height: 45,
                width: 270,
                child: TextFormField(
                  validator: validateEmail,
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
                    hintText: "Email",
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

              ///password
              SizedBox(
                height: 45,
                width: 270,
                child: TextFormField(
                  obscureText: true,
                  validator: validatePassword,
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
                    hintText: "password".tr,
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

              /// confirm password
              SizedBox(
                height: 45,
                width: 270,
                child: TextFormField(
                  obscureText: true,
                  validator: validateConfirmPassword,
                  controller: confirmPasswordController,
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
                    hintText: "confirmPassword".tr,
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

              /// user name
              SizedBox(
                height: 45,
                width: 270,
                child: TextFormField(
                  controller: userNameController,
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
                    hintText: "name".tr,
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

              /// privacy question
              SizedBox(
                height: 45,
                width: 270,
                child: TextFormField(
                  controller: privacyQuestionController,
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
                    hintText: "favouriteColor".tr,
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

              /// sign up button
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
                  onPressed: submitForm,
                  child: Center(
                    child: Text(
                      "signUp".tr,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 17, color: Colors.black),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

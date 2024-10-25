import 'package:flutter/material.dart';
import '../../../config/common_widget/text_widget.dart';
import '../../../config/images/image.dart';
import '../register/sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          Container(
            height: 220,
            width: 220,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(Images.login)),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Login to your account", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),),
            ],
          ),
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          SizedBox(
              height: 50,
              child: TextWidget("Username")),
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          SizedBox(
              height: 50,
              child: TextWidget("Password")),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot your password?",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
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
                onPressed: () {},
                child: const Center(
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create new one",
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Screen1()));
                },
                child: const Text(
                  "Sign up here",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

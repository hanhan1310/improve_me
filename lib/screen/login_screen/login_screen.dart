import 'package:flutter/material.dart';

import 'package:improve_me/widget/text_widget.dart';

import '../../widget/images/image.dart';
import '../new_user_screen/sign_up.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Login to your account", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),),
            ],
          ),
          SizedBox(
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
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 45,
            width: 150,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffA3EAFF),
                    side: BorderSide(
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
              Text(
                "Create new one",
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Screen1()));
                },
                child: Text(
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

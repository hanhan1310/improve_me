import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "profile".tr,
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
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          children: [
            SizedBox(
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
                    Text("Hoang An",
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

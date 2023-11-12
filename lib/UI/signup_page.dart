import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primam/helper/navigation_helper.dart';

import '../helper/fun_helper.dart';
import '../main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String password = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (text) {
                  email = text;
                  setState(() {});
                },
                decoration: const InputDecoration(
                    fillColor: Color(0xFFF1F5F9),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFF1F5F9), width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFF1F5F9), width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    hintStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    hintText: "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (text) {
                  password = text;
                  setState(() {});
                },
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                    fillColor: Color(0xFFF1F5F9),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFF1F5F9), width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFF1F5F9), width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    hintStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    hintText: "password"),
              ),
            ),
            ElevatedButton(
              onPressed: email.isNotEmpty && password.isNotEmpty
                  ? () async {
                      try {
                        await auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        router.goBack(context: context);
                      } catch (e) {
                        if (e.toString().contains("weak-password")) {
                          setSnackBar(
                              context, "The password provided is too weak.");
                        } else if (e
                            .toString()
                            .contains("email-already-in-use")) {
                          setSnackBar(context,
                              "The account already exists for that email.");
                        } else if (e
                            .toString()
                            .contains("The email address is badly formatted")) {
                          setSnackBar(
                              context, "The email address is badly formatted");
                        }
                      }
                    }
                  : null,
              child: Text("SignUp"),
            ),
          ],
        ),
      ),
    );
  }
}

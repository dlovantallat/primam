import 'package:flutter/material.dart';
import 'package:primam/UI/weather_page.dart';

import '../helper/fun_helper.dart';
import '../helper/navigation_helper.dart';
import '../main.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
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
            ElevatedButton(
              onPressed: email.isNotEmpty
                  ? () async {
                      try {
                        auth.sendPasswordResetEmail(email: email);

                        setSnackBar(context, "please check your Email");
                      } catch (e) {
                        print(e);
                        setSnackBar(
                            context, "The email address is badly formatted");
                      }
                    }
                  : null,
              child: Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}

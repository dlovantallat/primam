import 'package:flutter/material.dart';
import 'package:primam/UI/reset_password_page.dart';
import 'package:primam/UI/weather_page.dart';

import '../helper/fun_helper.dart';
import '../helper/navigation_helper.dart';
import '../main.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String password = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
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
                        await auth.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        router.goTo(
                            targetScreen: WeatherPage(),
                            context: context,
                            clean: true);
                      } catch (e) {
                        print(e);
                        if (e
                            .toString()
                            .contains("INVALID_LOGIN_CREDENTIALS")) {
                          setSnackBar(
                              context, "the email or password is wrong");
                        } else {
                          setSnackBar(context, "something went wrong");
                        }
                      }
                    }
                  : null,
              child: Text("SignIn"),
            ),
            TextButton(
              onPressed: () {
                router.goTo(
                    targetScreen: ResetPasswordPage(), context: context);
              },
              child: Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}

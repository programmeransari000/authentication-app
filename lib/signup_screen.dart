import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_interface/signin_screen.dart';

class SignupScreen extends StatelessWidget {
  var signup_email = TextEditingController();
  var signup_password = TextEditingController();

  SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/header-banner.png"),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "New User? Get Started Now",
                    style: GoogleFonts.alata(
                        fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/google.png", height: 30),
                      Image.asset("assets/facebook.png", height: 30),
                      Image.asset("assets/twitter.png", height: 30),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 1,
                        width: 130,
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "OR",
                        style: GoogleFonts.alata(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 1,
                        width: 130,
                        child: Container(color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter Email*",
                          style: GoogleFonts.alata(fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: signup_email,
                            decoration: const InputDecoration(
                              hintText: "abc@gmail.com",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter Password*",
                          style: GoogleFonts.alata(fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            controller: signup_password,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ElevatedButton(
                              onPressed: () {
                                if (signup_email.text != "" &&
                                    signup_password.text != "") {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: const Text("Successfully"),
                                      content: const Text(
                                          "Signup is successfully completed"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(14),
                                            child: InkWell(
                                                onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          SigninScreen(
                                                              signup_email:
                                                                  signup_email
                                                                      .text,
                                                              signup_password:
                                                                  signup_password
                                                                      .text),
                                                    )),
                                                child: const Text("Okay")),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: const Text("Alert|||"),
                                      content: const Text("Fill all fields"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(14),
                                            child: const Text("Okay"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              child: Text("Sign Up")),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ElevatedButton(
                              onPressed: () {
                                int length = 12;
                                bool includeNumbers = true;
                                bool includeLetters = true;
                                bool includeSpecialCharacters = true;

                                String letters = "QWETUIOPASDFGHJKLZXCVBNM";
                                String numbers = "0123456789";
                                String specialChars =
                                    "~!@#%^&*(|_-+*/?<:>[{}]);,";

                                String charac = "";
                                if (includeNumbers) {
                                  charac = charac + numbers;
                                }
                                if (includeLetters) {
                                  charac = charac + letters;
                                }
                                if (includeSpecialCharacters) {
                                  charac = charac + specialChars;
                                }

                                String password = "";
                                var random = Random();
                                for (int i = 1; i <= length; i++) {
                                  int index = random.nextInt(charac.length);
                                  password += charac[index];
                                }

                                signup_password.text = password;
                              },
                              child: Text(
                                "Generate Password",
                                style: TextStyle(fontSize: 13.5),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Terms and Conditions | Privacy Policy ",
                          style: GoogleFonts.alata(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SigninScreen(),
                              )),
                          child: Text(
                            "SignIn",
                            style: GoogleFonts.alata(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // Image.asset("assets/bottom-banner.png"),
        ],
      ),
    );
  }
}

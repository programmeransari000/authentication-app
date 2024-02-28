import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_interface/signup_screen.dart';

class SigninScreen extends StatelessWidget {
  String? signup_email;
  String? signup_password;
  SigninScreen({super.key, this.signup_email, this.signup_password});

  var signin_email = TextEditingController();
  var signin_password = TextEditingController();

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
                    "Sign In To Continue",
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
                            controller: signin_email,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Enter Password*",
                              style: GoogleFonts.alata(fontSize: 16),
                            ),
                            Text(
                              "Forgot Password",
                              style: GoogleFonts.alata(fontSize: 14),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            controller: signin_password,
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
                  Container(
                    width: 320,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                        onPressed: () {
                          if (signin_email.text != "" &&
                              signin_password.text != "") {
                            if (signin_email.text == signup_email &&
                                signin_password.text == signup_password) {
                              signin_email.clear();
                              signin_password.clear();
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Congratulations"),
                                  content: const Text("Credentials is correct"),
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
                            } else {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Wrong Credentials|||"),
                                  content:
                                      const Text("Email or Password is wrong"),
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
                        child: Text("Sign In")),
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
                                builder: (context) => SignupScreen(),
                              )),
                          child: Text(
                            "SignUp",
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

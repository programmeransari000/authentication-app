import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_interface/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 3),
        () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SigninScreen()))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/header-banner.png"),
          Column(
            children: [
              Text(
                "ANGEL SURE",
                style: GoogleFonts.akayaTelivigala(
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff2F80ED),
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                "assets/Image.png",
                height: 220,
              ),
            ],
          ),
          Image.asset("assets/bottom-banner.png"),
        ],
      ),
    );
  }
}

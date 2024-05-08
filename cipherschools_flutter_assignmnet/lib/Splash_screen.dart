import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'GetStartedScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => GetStartedScreen()),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.maxFinite,
        decoration: const BoxDecoration(color: Color.fromRGBO(123, 97, 255, 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/images/recordcircle.png'),
              ],
            ),
            const SizedBox(height: 80),
            Container(
              height: 100,
              width: 100,
              child: Image.asset('assets/images/Vector.png'),
            ),
            const SizedBox(height: 20),
            Container(
              height: 43,
              width: 234,
              child: Image.asset('assets/images/CipherX.png'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset('assets/images/recordcircle2.png'),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.cambay(
                                textStyle: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 0.54),
                                ),
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'By ',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.cambay(
                                textStyle: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 0.54),
                                ),
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'Open Source ',
                                ),
                                TextSpan(
                                  text: 'Community',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(248, 164, 1, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

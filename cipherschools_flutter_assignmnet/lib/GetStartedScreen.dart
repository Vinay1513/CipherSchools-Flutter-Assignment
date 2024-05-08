import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            height: double.infinity,
            width: double.maxFinite,
            decoration:
                const BoxDecoration(color: Color.fromRGBO(123, 97, 255, 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/Vector.png')),
                    const Spacer(),
                    Image.asset('assets/images/recordcircle.png')
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 300.0, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 47,
                        width: 300,
                        child: Text(
                          'Welcome to',
                          style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.w400,
                            fontSize: 40,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Center(
                        child: Container(
                          height: 90,
                          width: 90,
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/round.png',
                                fit: BoxFit.cover,
                              ),
                              Positioned.fill(
                                child: Image.asset(
                                  'assets/images/Vector (1).png',
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 110.0),
                      child: Container(
                          height: 43,
                          width: 234,
                          child: Image.asset(
                            'assets/images/CipherX1.png',
                            fit: BoxFit.contain,
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Container(
                  height: 30,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Text('The best way to track your expenses',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            )),
                      )
                    ],
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 21.0, left: 31),
                  child: Container(
                    height: 5,
                    width: 134,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(0, 0, 0, 1)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )));
  }
}

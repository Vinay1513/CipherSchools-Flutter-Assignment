import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 246, 229, 1),
              Color.fromRGBO(248, 237, 216, 0)
            ],
            stops: [0.0, 0.7],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 64,
                  width: 375,
                  child: Row(
                    children: [
                      Image.asset('assets/images/Avatar.png'),
                      const SizedBox(
                        width: 100,
                      ),
                      Image.asset('assets/images/Pill.png'),
                      const SizedBox(
                        width: 50,
                      ),
                      Image.asset('assets/images/notifiaction.png')
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 17,
              width: 113,
              child: Text(
                'Account Balance',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: const Color.fromRGBO(145, 145, 159, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 48,
              width: 348,
              child: Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: Text(
                  '₹38000',
                  style: GoogleFonts.inter(
                    fontSize: 40,
                    color: const Color.fromRGBO(22, 23, 25, 1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: 80,
                  width: 300,
                  child: Row(
                    children: [Image.asset('assets/images/picred.jpg')],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

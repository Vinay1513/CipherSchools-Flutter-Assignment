import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class ListItem {
  final String imageUrl;
  final String text;

  ListItem({required this.imageUrl, required this.text});
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<IconData> iconList = [
    Icons.home,
    Icons.monetization_on_rounded,
    Icons.pie_chart,
    Icons.person,
  ];

  int _bottomNavIndex = 0;

  final List<ListItem> items = [
    ListItem(
      imageUrl: 'assets/images/Acc.png',
      text: 'Account',
    ),
    ListItem(
      imageUrl: 'assets/images/setting.png',
      text: 'Settings',
    ),
    ListItem(
      imageUrl: 'assets/images/export.png',
      text: 'Export Data',
    ),
    ListItem(
      imageUrl: 'assets/images/logout.png',
      text: 'Logout',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: const Color.fromRGBO(246, 246, 246, 1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 74.0, left: 34),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      'assets/images/Avatar.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Username',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: const Color.fromRGBO(145, 145, 159, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            child: Image.asset('assets/images/pen.png'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Khushi Sharma',
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              color: const Color.fromRGBO(22, 23, 25, 1),
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 10,
                top: 27,
                left: 10,
              ),
              height: 356,
              width: 336,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38),
                color: Colors.white,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromARGB(255, 238, 229, 229),
                        ),
                      ),
                    ),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Image.asset(
                          items[index].imageUrl,
                          width: 100,
                          height: 150,
                        ),
                      ),
                      title: Text(items[index].text),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        inactiveColor: Colors.grey,
        activeColor: Colors.grey,
        iconSize: 20,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        backgroundColor: const Color.fromRGBO(252, 252, 252, 1),
      ),
    );
  }
}

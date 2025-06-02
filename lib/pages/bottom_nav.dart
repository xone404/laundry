import 'package:flutter/material.dart';
import 'package:syklin_apps/pages/home_screen.dart';
import 'package:syklin_apps/themes/colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  static final List<Widget> screenList = [HomeScreen()];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.15 * 255).toInt()),
              offset: Offset(0, -4),
              blurRadius: 15,
              spreadRadius: 0,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Image.asset(
                  'assets/ic-home-green.png',
                  width: 20,
                  height: 20,
                ),
              ),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Image.asset(
                  'assets/ic-pesanan.png',
                  width: 20,
                  height: 20,
                ),
              ),
              label: "Pesanan",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Image.asset(
                  'assets/ic-profil.png',
                  width: 20,
                  height: 20,
                ),
              ),
              label: "Profil",
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

import 'package:akkredit/pages/homepage.dart';
import 'package:akkredit/pages/profile_page.dart';
import 'package:akkredit/pages/wallet_page.dart';
import 'package:akkredit/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AppRoute extends StatefulWidget {
  const AppRoute({super.key});

  @override
  State<AppRoute> createState() => _AppRouteState();
}

class _AppRouteState extends State<AppRoute> {
  int _selectedIndex = 0;
  // ignore: prefer_final_fields
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ProfilePage(),
    WalletPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
            padding: const EdgeInsets.all(16),
            iconSize: 22,
            color: Colors.black,
            activeColor: Colors.white,
            backgroundColor: Colors.white,
            // tabMargin: EdgeInsets.symmetric(vertical: 3),
            tabBackgroundGradient: Gradient.lerp(
              LinearGradient(colors: [primaryOrange, secondaryOrange]),
              LinearGradient(colors: [primaryOrange, secondaryOrange]),
              45,
            ),
            gap: 5,
            tabs: const [
              GButton(
                  icon: FlutterRemix.home_2_line,
                  text: 'Home',
                  textColor: Colors.white),

              // GButton(
              //   icon: FlutterRemix.add_line,
              // ),
              GButton(
                icon: FlutterRemix.user_3_line,
                text: 'Profile',
              ),
              GButton(
                icon: FlutterRemix.wallet_3_line,
                text: 'Wallet',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

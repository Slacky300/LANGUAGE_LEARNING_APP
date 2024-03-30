import 'package:flutter/material.dart';
import 'package:lla/core/theme/app_pallete.dart';
import 'package:lla/features/dashboard/pages/featured_screen.dart';
import 'package:lla/services/auth_services.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FeatureScreen(),
    FeatureScreen(),
    FeatureScreen(),
    FeatureScreen()
  ];

  void signOut(BuildContext context) {
    AuthService().signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppPallete.primaryColor,
        unselectedItemColor: Colors.grey[800], // Set the unselected item color to black
        backgroundColor: Colors.white,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: "Lessons",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app_outlined),
            label: "Sign Out",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          if (index == 3) {
            // If sign out is tapped, call the signOut function
            signOut(context);
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }
}

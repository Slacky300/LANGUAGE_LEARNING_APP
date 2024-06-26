import 'package:flutter/material.dart';
import 'package:lla/core/theme/app_pallete.dart';
import 'package:lla/features/dashboard/pages/analytics_screen.dart';
import 'package:lla/features/dashboard/pages/featured_screen.dart';
import 'package:lla/services/auth_services.dart';
import 'package:lla/services/language_services.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

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

  final LanguageService languageService = LanguageService();

  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      languageService.getLanguages();
    });
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
            icon: Icon(Icons.play_circle_fill_outlined),
            label: "Continue",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: "Analytics",
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

          if(index == 0){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
          }

          if(index == 2){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AnalyticsScreen()));
          }




        },
      ),
    );
  }
}

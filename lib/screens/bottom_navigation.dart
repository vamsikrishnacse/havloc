import 'package:flutter/material.dart';
import 'package:haveloc/screens/policies.dart';
import 'package:haveloc/screens/profile.dart';
import '../screens/companies.dart';
import '../screens/jobs.dart';
import '../screens/policies.dart';
import '../screens/profile.dart';
import '../screens/feedback.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Widget>> _pages = [
    {

      'page': Jobs(),
    },
    {
      'page': Companies(),
    },
    {
      'page': Profile(),
    },
    {
      'page': Policies(),
    },
    {
      'page': Feedbackk(),
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('haveloc'),
      // ),
      body: Center(
        child: _pages[_selectedPageIndex]['page'],
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedFontSize: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedFontSize: 0, // <-- To also NOT saving space for the label
          elevation:3,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ), // companies
           label: '',
              // backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bubble_chart), // home
              label: '',
              // backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: '',
              // backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_police),
              label: '',
              // backgroundColor: Colors.pink,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.agriculture),
              label: '',
              // backgroundColor: Colors.pink,
            ),
          ],
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          selectedIconTheme: IconThemeData(
            color: Colors.black87,
            size: 27,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
            size: 27,
          ),
        ),
      ),
    );
  }
}

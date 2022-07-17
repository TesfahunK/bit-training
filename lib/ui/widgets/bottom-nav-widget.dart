import 'package:bit_initial/ui/screens/profile/community-page.dart';
import 'package:bit_initial/ui/screens/profile/personal-data.dart';
import 'package:bit_initial/ui/screens/profile/settings-page.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _current = 0;

  List<String> _titles = ["Settings", "Personal Data", "Community"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          _titles[_current],
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: [SettingsPage(), PersonalDataScreen(), CommunityPage()][_current],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepPurpleAccent,
          unselectedItemColor: Colors.black26,
          currentIndex: _current,
          onTap: (index) {
            setState(() {
              _current = index;
            });
          },
          items: [
            BottomNavigationBarItem(label: "", icon: Icon(Icons.settings)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.person)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.group)),
          ]),
    );
  }
}

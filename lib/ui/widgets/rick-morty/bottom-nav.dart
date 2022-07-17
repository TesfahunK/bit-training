import 'package:bit_initial/ui/screens/rick-morty/characters-screen.dart';
import 'package:bit_initial/ui/screens/rick-morty/episodes.dart';
import 'package:bit_initial/ui/screens/rick-morty/favourite.dart';
import 'package:bit_initial/ui/screens/rick-morty/locations.dart';
import 'package:flutter/material.dart';

class RnMBottomNavigationWidget extends StatefulWidget {
  RnMBottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<RnMBottomNavigationWidget> createState() =>
      _RnMBottomNavigationWidgetState();
}

class _RnMBottomNavigationWidgetState extends State<RnMBottomNavigationWidget> {
  int _current = 0;

  List<String> _titles = ["Characters", "Episodes", "Locations", "Saved"];
  List<Widget> _screens = [
    CharacterListScreen(),
    EpisodeListScreen(),
    LocationListScreen(),
    SavedItemListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.4,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          _titles[_current],
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5),
        ),
      ),
      body: _screens[_current],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black26,
          currentIndex: _current,
          onTap: (index) {
            setState(() {
              _current = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                label: "Characters", icon: Icon(Icons.group)),
            BottomNavigationBarItem(label: "Episodes", icon: Icon(Icons.movie)),
            BottomNavigationBarItem(
                label: "Locations", icon: Icon(Icons.location_on)),
            BottomNavigationBarItem(label: "Saved", icon: Icon(Icons.bookmark)),
          ]),
    );
  }
}

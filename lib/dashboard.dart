 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas/helper.dart';
import 'package:tugas/views/contact.dart';
import 'package:tugas/views/home.dart';
import 'package:tugas/views/location.dart';
import 'package:tugas/views/search.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    switch (index){
      case 0:
        toast("Home");
        break;
      case 1:
        toast("Search");
        break;
      case 2:
        toast("Location");
        break;
      case 3:
        toast("Contact");
        break;
    }
  }

  List pageList = [
    const Home(),
    const Search(),
    const Location(),
    const Contact()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xffeff2f9),
        elevation: 0,
        iconSize: 25,
        selectedFontSize: 15,
        selectedIconTheme: const IconThemeData(
            color: Color(0xffc21515),
            size: 25
        ),
        selectedItemColor: const Color(0xffcccdd0),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: "Location"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "Contact"
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
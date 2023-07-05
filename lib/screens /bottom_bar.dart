import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticketbookingapp/screens%20/home_screen.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int selectedIndex=0;
  static final List<Widget>_widgetOptions =<Widget>[
    HomeScreen(),
    const Text("Search"),
    const Text("tickets"),
    const Text("profile")
  ];

  void _onItemTapped(int index){
    setState(() {
      selectedIndex=index;
    });

    //print('tapped index is ${selectedIndex}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("My tickets"),
      // ),
      body: Center(
        child: _widgetOptions[selectedIndex],),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap:  _onItemTapped,
        elevation: 10,
       showSelectedLabels: false,
       showUnselectedLabels: false,
       selectedItemColor: Colors.blueGrey,
       type: BottomNavigationBarType.fixed,
       unselectedItemColor:  const Color(0xff526480),
       items: const [
         BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
             activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
             label: "home"),
         BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
             activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
             label: "search"),
         BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
             activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
             label: "tickets"),
         BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
             activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
             label: "profile")
       ],
      ),
    );
  }
}

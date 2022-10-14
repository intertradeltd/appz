import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:intertrade/screens/settings.dart';

import 'home_screen.dart';



class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title: Text("Bottom Nav Bar"),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ) ,

      ),
      body: SizedBox.expand(
        
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            
            HomeScreen(),
            Container(
              color: Colors.white,
              child: Center(
                child: Text('Page 2'),
              ),
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: Text('Page 3'),
              ),
            ),
           SettingsPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController!.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home)
          ),
          BottomNavyBarItem(
            title: Text('Blog'),
            icon: Icon(Icons.apps)
          ),
          BottomNavyBarItem(
            title: Text('Messages'),
            icon: Icon(Icons.chat_bubble)
          ),
          BottomNavyBarItem(
            title: Text('Settings'),
            icon: Icon(Icons.settings)
          ),
        ],
      ),
    );
  }
}
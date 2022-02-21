import 'package:flutter/material.dart';
import 'package:news_app_flutter/news_app.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> screens = <Widget>[
    const AllNewsScreen(),
    const FavoriteNewsScreen(),
    const SearchNewsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Note: If you are using a Scaffold with an AppBar, the appropriate
    /// spacing will be calculated at the top of the screen without needing to
    /// wrap the Scaffold in a SafeArea and the status bar background will be
    /// affected by the AppBar colour.
    /// If you wrap the Scaffold in a SafeArea, then the status bar area will
    /// have a black background rather than be influenced by the AppBar.
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:skin_app/skinpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: const HomeScreen()
        );
        
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Widget> _screens = [
    // Content for Home tab
    Container(
      color: Colors.yellow.shade100,
      alignment: Alignment.center,
      child: const Text(
        '_navigateToPage(Skinpage());',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Feed tab
    Container(
      color: Colors.purple.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Feed',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Favorites tab
    Container(
      color: Colors.red.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Favorites',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Settings tab
    Container(
      color: Colors.pink.shade300,
      alignment: Alignment.center,
      child: const Text(
        'Settings',
        style: TextStyle(fontSize: 40),
      ),
    )
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skin Visionary"),
      ),
      bottomNavigationBar:  MediaQuery.of(context).size.width < 640?
      BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color.fromARGB(255, 83, 254, 206),
          // called when one tab is selected
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          // bottom tab items
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.feed), label: 'Skin Disease'),
            BottomNavigationBarItem(
                icon: Icon(Icons.medical_services), label: 'Medicine'),
            BottomNavigationBarItem(
                icon: Icon(Icons.image), label: 'Images'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ]):null,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 640)
          NavigationRail(
            onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
              switch (index) {
                case 0:
                  _navigateToPage(Skinpage());
                  break;
                default:
                  break;
              }
            });
          },
            selectedIndex: _selectedIndex,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.feed), label: Text('Skin Disease')),
              NavigationRailDestination(
                  icon: Icon(Icons.medical_services), label: Text('Medicine')),
              NavigationRailDestination(
                  icon: Icon(Icons.image), label: Text('Images')),
              NavigationRailDestination(
                  icon: Icon(Icons.settings), label: Text('Settings')),
            ],

            labelType: NavigationRailLabelType.all,
            selectedLabelTextStyle: const TextStyle(
              color: Colors.teal,
            ),

            unselectedLabelTextStyle: const TextStyle(),
            // Called when one tab is selected
            leading: Column(
              children: const [
                SizedBox(
                  height: 8,
                ),
                
              ],
            ),

          ),
          Expanded(child: _screens[_selectedIndex])
        ],
      ),

    );
  }
void _navigateToPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
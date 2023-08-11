//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:skin_app/SkinDisease.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
     
    ),
    // Content for Feed tab
    Container(      
      color: Colors.purple.shade100,
      child: Row (
        children: [
          // Add a search icon or button outside the border of the search bar
        
          Expanded(
            // Use a Material design search bar
            child: TextField(
              //controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                // Add a clear button to the search bar
                // suffixIcon: IconButton(
                //   icon: Icon(Icons.clear),
                //   onPressed: () => _searchController.clear(),
                // ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Perform the search here
            },
          ),
        ],
      ),
    ),
    // Content for Favorites tab
    Container(
      color: Colors.red.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Favorites1',
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
  void initState() {
    super.initState();
    //retrieieveSkinDiseaseData();
  }
  
  static get skinlist => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data"),
      ),
      bottomNavigationBar:  MediaQuery.of(context).size.width < 640?
      BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.indigoAccent,
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
                icon: Icon(Icons.medical_services), label: 'Medicind'),
            BottomNavigationBarItem(
                icon: Icon(Icons.image), label: 'image'),
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
              });
            },
            selectedIndex: _selectedIndex,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.feed), label: Text('Skin Disease')),
              NavigationRailDestination(
                  icon: Icon(Icons.medical_services), label: Text('Medicind')),
              NavigationRailDestination(
                  icon: Icon(Icons.image), label: Text('image')),
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
                CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.person),
                ),
              ],
            ),

          ),
          Expanded(child: _screens[_selectedIndex])
        ],
      ),
  
    );
  }
  
  // void retrieieveSkinDiseaseData() async{
  //   skinlist.clear();
  //    var dbRef;
  //    await dbRef.child('SkinDisease').once().then((snapshot) {
  //     print('Data : ${snapshot.value}');
  //     Map<dynamic, dynamic> values = snapshot.value;
  //     values.forEach((k, v) {
  //       print('ชื่อโรค');
  //     });
  //   });

  // }
}
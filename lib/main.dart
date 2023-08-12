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
        theme: ThemeData(primarySwatch: Colors.teal),
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
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Skin Disease',
                  icon: Icon(Icons.feed),
                ),
                Tab(
                  text: 'Medicine',
                  icon: Icon(Icons.directions_car),
                ),
                Tab(
                  text: 'Image',
                  icon: Icon(Icons.image),
                ),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              SkinDataPage(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  } 
}
class SkinDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        //Color:(Colors.teal),
        columns: const [
          
          DataColumn(label: Text('ชื่อโรค')),
          DataColumn(label: Text('Name')),
        ],
        rows: const [
          DataRow(cells: [DataCell(Text('1')), DataCell(Text('John'))]),
          DataRow(cells: [DataCell(Text('2')), DataCell(Text('Jane'))]),
          DataRow(cells: [DataCell(Text('3')), DataCell(Text('Doe'))]),
        ],
      ),
    );
  }
}
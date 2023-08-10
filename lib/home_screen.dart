import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}): super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skin Disease Data'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        skinDisease();
      },child: const Icon(Icons.save),),
    );
  }
  void skinDisease() {
    showDialog(context: context, builder: (context){
      return Dialog(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(decoration: InputDecoration(helperText: "ชื่อโรค"),),
              TextField(decoration: InputDecoration(helperText: "อาการ")),
              TextField(decoration: InputDecoration(helperText: "สาเหตุ")),
              TextField(decoration: InputDecoration(helperText: "การรักษา")),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: (){}, child: Text("Save"))
            ]
          ),
        ),
      );
    });
  }  
}


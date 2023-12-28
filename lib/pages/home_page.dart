import 'package:flutter/material.dart';
import 'package:thirty_days_flutter/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Container(
          child: Text("Hello 30 days"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

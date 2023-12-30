import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thirty_days_flutter/models/catalog.dart';
import 'dart:convert';
import 'package:thirty_days_flutter/widgets/drawer.dart';
import 'package:thirty_days_flutter/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
   var catalogJson =  await rootBundle.loadString("assets/files/catalog.json");
  //  print(catalogJson);
   var decodedData = jsonDecode(catalogJson);
   var productData = decodedData["products"];

   CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item) ).toList();

   setState(() {
     
   });

  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App", style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty) ? ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index){
            return ItemWidget(item: CatalogModel.items[index],);
          }
        ): Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

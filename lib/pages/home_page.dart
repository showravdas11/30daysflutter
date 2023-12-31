import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thirty_days_flutter/models/catalog.dart';
import 'package:thirty_days_flutter/widgets/home_widgets/catalog_header.dart';
import 'package:thirty_days_flutter/widgets/home_widgets/catalog_list.dart';
import 'dart:convert';
import 'package:thirty_days_flutter/widgets/drawer.dart';
import 'package:thirty_days_flutter/widgets/item_widget.dart';
import 'package:thirty_days_flutter/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    //  print(catalogJson);
    var decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];

    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  Center(
                    child: CircularProgressIndicator().expand(),
                  )
              ],
            ),
          ),
        ));
  }
}








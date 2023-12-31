import 'package:flutter/material.dart';
import 'package:thirty_days_flutter/models/catalog.dart';
import 'package:thirty_days_flutter/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key, required this.catalog});

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 255, 255, 255)),
                backgroundColor:
                    MaterialStatePropertyAll(MyTheme.darkBluishColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text("Buy"),
            ).wh(100, 50),
          ],
        ).p24(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: (catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(MyTheme.darkBluishColor)
                            .bold
                            .make(),
                        catalog.desc.text.xl
                            .textStyle(context.captionStyle)
                            .make(),
                      ],
                    ).py64()),
              ),
            )
          ],
        ),
      ),
    );
  }
}

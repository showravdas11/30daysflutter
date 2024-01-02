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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.color(context.theme.floatingActionButtonTheme.backgroundColor).bold.xl4.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 255, 255, 255)),
                backgroundColor:
                    MaterialStatePropertyAll(context.theme.floatingActionButtonTheme.backgroundColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text("Add to cart"),
            ).wh(120, 50),
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
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(context.theme.floatingActionButtonTheme.backgroundColor)
                            .bold
                            .make(),
                        catalog.desc.text.xl.color(context.theme.floatingActionButtonTheme.backgroundColor)
                            .textStyle(context.captionStyle)
                            .make(),
                        10.heightBox,
                        "Non labore mollit dolor minim do nisi excepteur. Excepteur in do dolor in laborum voluptate anim incididunt fugiat cupidatat et eu nostrud. Occaecat amet esse exercitation et proident qui elit nostrud aliqua veniam qui Lorem. In nostrud proident duis minim enim minim est adipisicing consectetur id ullamco fugiat est."
                            .text.textStyle(context.captionStyle).color(context.theme.floatingActionButtonTheme.backgroundColor)
                            .make().p16()
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

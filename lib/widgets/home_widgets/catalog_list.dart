import 'package:flutter/material.dart';
import 'package:thirty_days_flutter/models/catalog.dart';
import 'package:thirty_days_flutter/pages/home_details_page.dart';
import 'package:thirty_days_flutter/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailPage(catalog: catalog)));
            },
            child: CatalogItem(catalog: catalog)
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({Key? key, required this.catalog});

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: VxBox(
        child: Row(
          children: [
            Hero(
              tag: (catalog.id.toString()),
              child: Image.network(catalog.image)
                  .box
                  .roundedSM
                  .p8
                  .color(context.canvasColor)
                  .make()
                  .p8()
                  .w40(context),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.lg.color(context.theme.floatingActionButtonTheme.backgroundColor).bold.make(),
                  catalog.desc.text.color(context.theme.floatingActionButtonTheme.backgroundColor).textStyle(context.captionStyle).make(),
                  // Spacer(),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "\$${catalog.price}".text.color(context.theme.floatingActionButtonTheme.backgroundColor).bold.sm.make(),
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ).color(context.cardColor) .rounded.square(100).make().py16(),
    );
  }
}
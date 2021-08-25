import 'package:flutter/material.dart';
import 'package:popol_club/providers/products.dart';
import 'package:provider/provider.dart';
import './card.dart';
import '';
import '';

class Listview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 7);
      },
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (cxt, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(
            // products[i].id,
            // products[i].imageUrl,
            // products[i].title,
            // products[i].type,
            // products[i].price,
            ),
      ),
    );
  }
}

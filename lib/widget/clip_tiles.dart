import 'package:flutter/material.dart';
import 'package:popol_club/providers/chip_providers.dart';
import 'package:popol_club/widget/clip.dart';
import 'package:provider/provider.dart';

class Clipview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ChipProducts>(context);
    final products = productsData.lists;
    return ChangeNotifierProvider(
      create: (ctx) => ChipProducts(),
      builder: (context, child) => ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 5);
        },
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (cxt, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: Clipping(),
        ),
      ),
    );
  }
}

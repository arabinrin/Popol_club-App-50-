import 'package:flutter/material.dart';
import 'package:popol_club/providers/cart.dart';
import 'package:popol_club/providers/products.dart';
import 'package:provider/provider.dart';
import './cart.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Expanded(
      child: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (ctx, i) => CartTile(
          cart.items.values.toList()[i].id,
          cart.items.keys.toList()[i],
          cart.items.values.toList()[i].price,
          cart.items.values.toList()[i].quantity,
          cart.items.values.toList()[i].title,
          cart.items.values.toList()[i].imageUrl,
        ),
      ),
    );
  }
}

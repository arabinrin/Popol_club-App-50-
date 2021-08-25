import 'package:flutter/material.dart';
import 'package:popol_club/models/product.dart';
import 'package:popol_club/providers/cart.dart';
import 'package:popol_club/style/color.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String imageUrl;

  CartTile(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
    this.imageUrl,
  );
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text('The item will be removed from the cart'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                      child: Text('Yes'),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                      child: Text('No'),
                    ),
                  ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        height: 90,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.7)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
            SizedBox(width: 9),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Total: \$${(price * quantity).toStringAsFixed(2)}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Addbox(
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {},
                        iconSize: 15,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Text(
                        '$quantity',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Addbox(
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {},
                        iconSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 9,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    alignment: Alignment.topRight,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: IconButton(
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false)
                            .removeItem(id);
                      },
                      icon: Icon(Icons.delete_outline_outlined),
                      color: AppColors.pink400,
                    )),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: FlatButton(
                    color: AppColors.pink400,
                    padding: EdgeInsets.all(10),
                    onPressed: () {},
                    child: Text(
                      'ADD TO CART',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Addbox extends StatelessWidget {
  final Widget add;
  Addbox(this.add);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: AppColors.pink400),
      ),
      child: add,
    );
  }
}

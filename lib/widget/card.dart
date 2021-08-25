import 'package:flutter/material.dart';
import 'package:popol_club/models/product.dart';
import 'package:popol_club/providers/products.dart';
import 'package:popol_club/style/color.dart';
import 'package:popol_club/widget/custom_dialog.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialog(product.id, product.imageUrl, product.title,
                product.type, product.price);
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(5),
        height: 90,
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.6),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            topLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.pink400),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(product.imageUrl),
                  ),
                ),
              ),
              SizedBox(width: 9),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.title,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    product.type,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50)),
                      color: AppColors.pink400,
                    ),
                    child: Text(
                      'detail',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ]),
            Column(
              children: <Widget>[
                Container(
                  height: 20,
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                    color: AppColors.pink400,
                  ),
                  child: Text(
                    'Pay \$${product.price}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

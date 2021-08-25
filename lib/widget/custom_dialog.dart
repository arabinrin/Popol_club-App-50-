import 'package:flutter/material.dart';
import 'package:popol_club/providers/cart.dart';
import 'package:popol_club/style/color.dart';
import 'package:provider/provider.dart';

class CustomDialog extends StatelessWidget {
  final String id;
  final String imagePath;
  final String productName;
  final String type;
  final double discount;
  CustomDialog(
    this.id,
    this.imagePath,
    this.productName,
    this.type,
    this.discount,
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    final cart = Provider.of<Cart>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      height: height * 0.4,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(0, 2), blurRadius: 2, color: Color(0xFFFFE3E3))
          ]),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              height: 130,
              decoration: BoxDecoration(
                color: AppColors.pink400.withOpacity(.5),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      AppColors.pink400.withOpacity(0.5), BlendMode.dstATop),
                  fit: BoxFit.fill,
                  image: NetworkImage(imagePath),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        productName,
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        type,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ]),
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topRight,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      child: Text(
                        'Price: \$$discount',
                        style: TextStyle(
                            color: AppColors.pink400,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Addbox(
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      cart.addItem(id, discount, productName, imagePath);
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Addbox(
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      cart.subItem(id, discount, productName, imagePath);
                    },
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: width * 0.35,
                  child: FlatButton(
                    color: AppColors.pink400,
                    padding: EdgeInsets.all(10),
                    onPressed: () {},
                    child: Text(
                      'ADD TO CART',
                      style: TextStyle(color: Colors.white),
                    ),
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

class Addbox extends StatelessWidget {
  final Widget add;
  Addbox(this.add);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: AppColors.pink400),
      ),
      child: add,
    );
  }
}

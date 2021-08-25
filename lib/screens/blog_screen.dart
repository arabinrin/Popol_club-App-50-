import 'package:flutter/material.dart';
import 'package:popol_club/providers/product_blog.dart';
import 'package:popol_club/screens/edit_blog_screen.dart';
import 'package:popol_club/screens/land_page.dart';
import 'package:popol_club/style/color.dart';
import 'package:popol_club/widget/blog_tiles.dart';
import 'package:popol_club/widget/nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogScreen extends StatefulWidget {
  static const routeName = '/blog';
  // final Cart order;

  // CartScreen(this.order);

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    final blog = Provider.of<ProductBlogs>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(EditBlogScreen.routeName);
        },
        child: Icon(Icons.add),
        backgroundColor: AppColors.pink400,
      ),
      backgroundColor: Color(0xFFFFE3E3).withOpacity(0.2),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        NavBar.routeName,
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 20,
                    ),
                  ),
                  Text(
                    'Blog',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notification_add,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: blog.blogs.length != 0
                  ? BlogTile()
                  : Column(
                      children: <Widget>[
                        Container(
                          child: SvgPicture.asset(
                            'assets/images/cart.svg',
                            height: MediaQuery.of(context).size.height * 0.6,
                            alignment: Alignment.center,
                          ),
                        ),
                        Text(
                          'No Blog Post',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.pink400,
                              fontSize: 20),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .85,
              padding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              // child: Column(
              //   children: <Widget>[
              // Container(
              //   height: 35,
              //   width: MediaQuery.of(context).size.width * 0.8,
              //   decoration: BoxDecoration(
              //       color: Colors.pinkAccent[400],
              //       borderRadius: BorderRadius.circular(20)),
              //   child: FlatButton(
              //     onPressed: () {
              //       if (cart.totalAmount != 0) {
              //         Provider.of<Orders>(context, listen: false).addOrder(
              //           cart.items.values.toList(),
              //           cart.totalAmount,
              //         );
              //         cart.clear();
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: (_) => OrderScreen()));
              //       }
              //     },
              //     child: Text(
              //       'Place Order',
              //       style: TextStyle(color: Colors.white, fontSize: 20),
              //     ),
              //   ),
              // ),
              //   ],
              // ),
            )
          ],
        ),
      ),
    );
  }
}

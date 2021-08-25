import 'package:flutter/material.dart';
import 'package:popol_club/models/product_blog.dart';
import 'package:popol_club/providers/cart.dart';
import 'package:popol_club/providers/product_blog.dart';
import 'package:popol_club/widget/blog.dart';
import 'package:provider/provider.dart';
import './cart.dart';

class BlogTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blogPost = Provider.of<ProductBlogs>(context);
    final blog = blogPost.blogs;
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 7);
      },
      padding: EdgeInsets.all(10),
      itemCount: blog.length,
      itemBuilder: (cxt, i) => ChangeNotifierProvider.value(
        value: blog[i],
        child: Blog(
          blog[i].id,
          blog[i].title,
          blog[i].type,
          blog[i].dateTime,
          blog[i].blogContent,
          blog[i].likes,
          blog[i].views,
          blog[i].coments,
        ),
      ),
    );
  }
}

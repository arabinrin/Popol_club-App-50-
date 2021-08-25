import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:popol_club/models/product_blog.dart';
import 'package:popol_club/providers/product_blog.dart';
import 'package:popol_club/style/color.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Blog extends StatefulWidget {
  final String id;
  final String title;
  final String type;
  DateTime dateTime;
  final String blogContents;
  int likes;
  int views;
  int comments;
  Blog(
    this.id,
    this.title,
    this.type,
    this.dateTime,
    this.blogContents,
    this.likes,
    this.views,
    this.comments,
  );

  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    // final blog = Provider.of<ProductBlog>(context);
    final blogs = Provider.of<ProductBlogs>(context);

    return Container(
      padding: EdgeInsets.all(6),
      height: 250,
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(
              color: AppColors.pink400,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 8),
          Text(
            widget.type,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            DateFormat('dd/MM/yyyy hh:mm').format(widget.dateTime),
            style: TextStyle(fontSize: 10),
          ),
          SizedBox(height: 5),
          Text(widget.blogContents),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.pink400),
                    child: IconButton(
                      onPressed: () {},
                      // blogs.blogLike(widget.id),
                      icon: Icon(
                        Icons.thumb_up,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                  Text('${widget.likes}'),
                ],
              ),
              SizedBox(width: 10),
              Row(
                children: <Widget>[
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.pink400),
                    child: Icon(
                      Icons.visibility,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  Text('${widget.views}'),
                ],
              ),
              SizedBox(width: 10),
              Row(
                children: <Widget>[
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.pink400),
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  Text('${widget.comments}'),
                ],
              ),
              SizedBox(width: 20),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.pink400),
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

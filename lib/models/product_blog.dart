import 'package:flutter/foundation.dart';

class ProductBlog with ChangeNotifier {
  final String id;
  final DateTime dateTime;
  final String title;
  final String type;
  final String blogContent;
  int likes;
  final int coments;
  final int views;
  ProductBlog({
    @required this.id,
    @required this.title,
    @required this.type,
    @required this.dateTime,
    @required this.blogContent,
    this.likes = 0,
    this.coments = 0,
    this.views = 0,
  });
}

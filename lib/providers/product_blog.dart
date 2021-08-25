import 'package:flutter/cupertino.dart';
import 'package:popol_club/models/product_blog.dart';

class ProductBlogs with ChangeNotifier {
  List<ProductBlog> _blogs = [
    ProductBlog(
      id: 'id1',
      title: 'Covid 19 briefing',
      type: 'Health Concerns',
      dateTime: DateTime.now(),
      views: 100,
      coments: 100,
      likes: 100,
      blogContent: '''
The virus that causes COVID-19 is mainly transmitted through droplets generated when an infected person coughs, sneezes, or exhales. These droplets are too heavy to hang in the air, and quickly fall on floors or surfaces.
You can be infected by breathing in the virus if you are within close proximity of someone who has COVID-19, or by touching a contaminated surface and then your eyes, nose or mouth.
''',
    ),
    ProductBlog(
      id: 'id2',
      title: 'Covid 19 briefing',
      type: 'Health Concerns',
      dateTime: DateTime.now(),
      views: 100,
      coments: 100,
      likes: 100,
      blogContent: '''
The virus that causes COVID-19 is mainly transmitted through droplets generated when an infected person coughs, sneezes, or exhales. These droplets are too heavy to hang in the air, and quickly fall on floors or surfaces.
You can be infected by breathing in the virus if you are within close proximity of someone who has COVID-19, or by touching a contaminated surface and then your eyes, nose or mouth.
''',
    ),
    ProductBlog(
      id: 'id3',
      title: 'Covid 19 briefing',
      type: 'Health Concerns',
      dateTime: DateTime.now(),
      views: 100,
      coments: 100,
      likes: 100,
      blogContent: '''
The virus that causes COVID-19 is mainly transmitted through droplets generated when an infected person coughs, sneezes, or exhales. These droplets are too heavy to hang in the air, and quickly fall on floors or surfaces.
You can be infected by breathing in the virus if you are within close proximity of someone who has COVID-19, or by touching a contaminated surface and then your eyes, nose or mouth.
''',
    ),
  ];
  List<ProductBlog> get blogs {
    return [..._blogs];
  }

  void addBlog(ProductBlog blog) {
    final newBlog = ProductBlog(
      title: blog.title,
      type: blog.type,
      dateTime: blog.dateTime,
      blogContent: blog.blogContent,
      likes: blog.likes,
      coments: blog.coments,
      views: blog.views,
      id: DateTime.now().toString(),
    );
    _blogs.add(newBlog);
    // _items.insert(0, newProduct); // at the start of the list
    notifyListeners();
  }

  void updateBlog(String id, ProductBlog newBlog) {
    final prodIndex = _blogs.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _blogs[prodIndex] = newBlog;
      notifyListeners();
    } else {
      print('...');
    }
  }

  ProductBlog findById(String id) {
    return _blogs.firstWhere((prod) => prod.id == id);
  }

  ProductBlog blogLike(String id) {
    return _blogs.firstWhere((prod) => prod.id == id);
  }
}

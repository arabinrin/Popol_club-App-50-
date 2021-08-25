// @dart=2.9

import 'package:flutter/material.dart';
import 'package:popol_club/models/product_blog.dart';
import 'package:popol_club/providers/product_blog.dart';
import 'package:popol_club/style/color.dart';
import 'package:provider/provider.dart';

class EditBlogScreen extends StatefulWidget {
  static const routeName = '/edit-blog';

  @override
  _EditBlogScreenState createState() => _EditBlogScreenState();
}

class _EditBlogScreenState extends State<EditBlogScreen> {
  final _titleFocusNode = FocusNode();
  final _typeFocusNode = FocusNode();
  final _dateTimeFocusNode = FocusNode();
  final _blogContentsFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedBlog = ProductBlog(
    id: '',
    title: '',
    type: '',
    dateTime: DateTime.now(),
    blogContent: '',
  );

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _typeFocusNode.dispose();
    _blogContentsFocusNode.dispose();
    _dateTimeFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();

    Provider.of<ProductBlogs>(context, listen: false).addBlog(_editedBlog);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 20,
                    ),
                  ),
                  Text(
                    'Edit Blog',
                    style: TextStyle(
                      color: AppColors.pink400,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .5,
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Title'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_typeFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a Product.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedBlog = ProductBlog(
                            id: _editedBlog.id,
                            title: value.toString(),
                            type: _editedBlog.type,
                            dateTime: _editedBlog.dateTime,
                            blogContent: _editedBlog.blogContent);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'type'),
                      textInputAction: TextInputAction.next,
                      focusNode: _typeFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_blogContentsFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter product type.';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _editedBlog = ProductBlog(
                          id: _editedBlog.id,
                          title: _editedBlog.title,
                          type: value.toString(),
                          dateTime: _editedBlog.dateTime,
                          blogContent: _editedBlog.blogContent,
                        );
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'blogContent'),
                      textInputAction: TextInputAction.next,
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      focusNode: _blogContentsFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Write Here';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _editedBlog = ProductBlog(
                          id: _editedBlog.id,
                          title: _editedBlog.title,
                          type: _editedBlog.type,
                          dateTime: _editedBlog.dateTime,
                          blogContent: value.toString(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                  color: Colors.pinkAccent[400],
                  borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: _saveForm,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

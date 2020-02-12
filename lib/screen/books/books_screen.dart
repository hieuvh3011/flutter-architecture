import 'package:flutter/material.dart';
import 'package:flutter_architecture/store/books_store.dart';
import 'package:flutter_architecture/theme/colors.dart';
import 'package:flutter_architecture/widget/book_item.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BooksScreen extends StatefulWidget {
  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  BooksStore _booksStore = BooksStore();

  @override
  void initState() {
    super.initState();

    _booksStore.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              // Use localization in real app please!!!
                'Books'),
          ),
          backgroundColor: AppColors.white,
          body: Observer(
            builder: (_) {
              return _buildBooksList();
            },
          )),
    );
  }

  _buildBooksList() {
    if (_booksStore.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (_booksStore.books.isEmpty) {
      return Container();
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: _booksStore.books?.length,
              itemBuilder: (context, index) {
                return BookItem(
                  title: _booksStore.books[index].title,
                  description: _booksStore.books[index].description,
                );
              }),
        ),
        RaisedButton(
          child: Text(
            // Use localization in real app please!!!
              'Get Books (Remote only)'),
          onPressed: () {
            _booksStore.getBooks(remoteOnly: true);
          },
        )
      ],
    );
  }
}

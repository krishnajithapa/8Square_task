import 'package:flutter/material.dart';
import 'package:hamro_library/home/models/book_model.dart';
import 'package:hamro_library/home/services/database_helper.dart';

class BookProvider with ChangeNotifier {
  bool isLoading = false;
  final dbHelper = DatabaseHelper.instance;
  List<Book> bookList = [];
  List<Book> searchList = [];

  fetchBooksByCatagory(catagoryName) async {
    isLoading = true;

    bookList = await dbHelper.getAllBooksBycatagory(catagoryName);
    isLoading = false;
    notifyListeners();
  }

  searchBook(bookName) async {
    isLoading = true;
    searchList = await dbHelper.searchByName(bookName);
    isLoading = false;
    notifyListeners();
  }

  addBook(row) {
    dbHelper.insert(row);
    notifyListeners();
  }

  deleteBook(id) {
    dbHelper.delete(id);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:hamro_library/auth/services/database_helper.dart';
import 'package:hamro_library/home/models/book_model.dart';
import 'package:hamro_library/home/providers/book_provider.dart';
import 'package:hamro_library/shared/utils/const.dart';
import 'package:provider/provider.dart';

class BookCard extends StatefulWidget {
  const BookCard({Key? key, required this.book}) : super(key: key);
  final Book book;
  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  final dbHelper = DatabaseHelper.instance;
  String dropdownValue = 'NPR';
  bool isNPR = true;
  double usdPrice = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 1,
      child: Card(
        color: const Color.fromARGB(255, 147, 225, 102),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.menu_book_sharp),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      widget.book.bookName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          overflow: TextOverflow.clip),
                    ),
                  ),
                  Text("By: ${widget.book.author}"),
                  isNPR
                      ? Text("NPR ${widget.book.price}")
                      : Text('USD ${usdPrice.toStringAsFixed(2)}')
                ]),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                converToUSD(widget.book.price);

                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['NPR', 'USD']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            IconButton(
                onPressed: () {
                  deleteItem();
                },
                icon: Icon(Icons.delete))
          ],
        )),
      ),
    );
  }

  deleteItem() {
    context.read<BookProvider>().deleteBook(widget.book.id);
    context.read<BookProvider>().fetchBooksByCatagory(widget.book.catagory);
    context.read<BookProvider>().searchBook(widget.book.bookName);
  }

  converToUSD(int price) {
    setState(() {
      isNPR = !isNPR;
      usdPrice = (price / usdRate);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:hamro_library/auth/services/database_helper.dart';
import 'package:hamro_library/home/providers/book_provider.dart';
import 'package:hamro_library/home/widgets/bookcard.dart';
import 'package:provider/provider.dart';

class CatagoryDetailScreen extends StatefulWidget {
  const CatagoryDetailScreen({Key? key, required this.catagoryName})
      : super(key: key);
  final String catagoryName;
  @override
  State<CatagoryDetailScreen> createState() => _CatagoryDetailScreenState();
}

class _CatagoryDetailScreenState extends State<CatagoryDetailScreen> {
  final dbHelper = DatabaseHelper.instance;
  final TextEditingController _bookNameController = TextEditingController();
  final TextEditingController _bookCatagoryController = TextEditingController();
  final GlobalKey<FormState> _fKey = GlobalKey<FormState>();
  @override
  void initState() {
    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    bookProvider.fetchBooksByCatagory(widget.catagoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookList = context.watch<BookProvider>().bookList;
    bool loading = context.read<BookProvider>().isLoading;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catagoryName),
        centerTitle: true,
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: bookList.length,
              itemBuilder: ((context, index) {
                return BookCard(book: bookList[index]);
              })),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepOrangeAccent.shade200,
        onPressed: () {
          showAlertDialog(
            context,
          );
        },
        label: const Text('Add Book'),
      ),
    );
  }

  addBook(bookName, bookCatagory) {
    context.read<BookProvider>().addBook(
      {
        DatabaseHelper.columnId: null,
        DatabaseHelper.columnName: bookName,
        DatabaseHelper.columnAuthor: 'Random Kumar',
        DatabaseHelper.columnCatagory: bookCatagory,
        DatabaseHelper.columnPrice: 500,
      },
    );

    setState(() {});
    context.read<BookProvider>().fetchBooksByCatagory(widget.catagoryName);
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget addButton = TextButton(
      child: const Text("Add"),
      onPressed: () {
        if (_fKey.currentState!.validate()) {
          dynamic result =
              addBook(_bookNameController.text, _bookCatagoryController.text);
          if (result == String) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error Adding Book')));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Book Added Successfully')));
          }
          Navigator.pop(context);
        }
      },
    );
    Widget cancel = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Enter Book Details",
        style: TextStyle(color: Colors.red),
      ),
      content: SizedBox(
        height: 200,
        child: Form(
          key: _fKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BookField(bookNameController: _bookNameController),
              CatagoryField(bookCatagoryController: _bookCatagoryController),
            ],
          ),
        ),
      ),
      actions: [
        cancel,
        addButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class BookField extends StatelessWidget {
  const BookField({
    Key? key,
    required TextEditingController bookNameController,
  })  : _bookNameController = bookNameController,
        super(key: key);

  final TextEditingController _bookNameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _bookNameController,
      decoration: const InputDecoration(
          label: Text('Book Name'), border: OutlineInputBorder()),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Book Name cant be empty';
        } else {
          return null;
        }
      },
    );
  }
}

class CatagoryField extends StatelessWidget {
  const CatagoryField({
    Key? key,
    required TextEditingController bookCatagoryController,
  })  : _bookCatagoryController = bookCatagoryController,
        super(key: key);

  final TextEditingController _bookCatagoryController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _bookCatagoryController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Catagory name cant be empty';
        } else if (value != 'math' &&
            value != 'science' &&
            value != 'nobel' &&
            value != 'economic') {
          return "Invalid Catagory";
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
          label: Text('Catagory'), border: OutlineInputBorder()),
    );
  }
}

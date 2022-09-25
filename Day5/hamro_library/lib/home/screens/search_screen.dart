import 'package:dbhelper/model/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:hamro_library/home/providers/book_provider.dart';
import 'package:hamro_library/home/widgets/bookcard.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    search(_searchController.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool searching = context.watch<BookProvider>().isLoading;
    List<Book> bookList = context.watch<BookProvider>().searchList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        hintText: 'Seach book by name',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.deepPurple))),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await search(_searchController.text);
                      // if (bookList.isEmpty) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       const SnackBar(content: Text("No Book found")));
                      // }
                    },
                    child: const Text("Search"))
              ],
            ),
          ),
          bookList.isEmpty
              ? Expanded(
                  child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Lottie.asset('assets/animations/search.json')),
                )
              : Expanded(
                  child: SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: searching
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: bookList.length,
                            itemBuilder: (context, index) {
                              return BookCard(
                                book: bookList[index],
                              );
                            }),
                  ),
                )
        ],
      ),
    );
  }

  search(bookName) {
    context.read<BookProvider>().searchBook(bookName);
  }
}

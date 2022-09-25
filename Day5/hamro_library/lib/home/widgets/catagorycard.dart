import 'package:flutter/material.dart';
import 'package:hamro_library/home/screens/catagory_detail_screen.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CatagoryDetailScreen(catagoryName: widget.title)));
          },
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: Card(
              color: const Color.fromARGB(255, 199, 129, 193),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Flexible(
                        child: Icon(
                      Icons.menu_book_sharp,
                      size: 100,
                    )),
                    Flexible(
                      child: Text(
                        widget.title.toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

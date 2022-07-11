import 'package:flutter/material.dart';

class FavCatCard extends StatefulWidget {
  const FavCatCard({Key? key}) : super(key: key);

  @override
  State<FavCatCard> createState() => _FavCatCardState();
}

class _FavCatCardState extends State<FavCatCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(color: Colors.red, height: 100, width: 100),
          const Text("Cat Name"),
          ElevatedButton(onPressed: () {}, child: const Text("unfav")),
        ],
      ),
    );
  }
}

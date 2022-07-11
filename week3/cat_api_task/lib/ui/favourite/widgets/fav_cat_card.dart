import 'package:cat_api_task/models/favourite.dart';
import 'package:flutter/material.dart';

class FavCatCard extends StatelessWidget {
  const FavCatCard({Key? key, required this.fav}) : super(key: key);
  final Favourite fav;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 201, 188, 188),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(fav.image!.url!), fit: BoxFit.cover)),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("unfav")),
        ],
      ),
    );
  }
}

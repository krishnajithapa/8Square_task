import 'package:cat_api_task/models/favourite.dart';
import 'package:cat_api_task/ui/favourite/providers/favourite_provider.dart';
import 'package:cat_api_task/ui/favourite/widgets/fav_cat_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<FavouriteProvider>().getAllFavourites(),
        builder: (context, AsyncSnapshot<List<Favourite>?> snapshot) {
          return snapshot.data == null ||
                  snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return FavCatCard(
                      fav: snapshot.data![index],
                    );
                  });
        });
  }
}

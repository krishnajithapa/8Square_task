import 'package:cat_api_task/ui/voting/providers/voting_provider.dart';
import 'package:cat_api_task/ui/voting/widgets/voting_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VoteCatBody extends StatelessWidget {
  const VoteCatBody({
    Key? key,
    required this.voteprovider,
  }) : super(key: key);

  final VotingProvider voteprovider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                image: voteprovider.isLoading
                    ? null
                    : DecorationImage(
                        image: NetworkImage(
                          voteprovider.randomCat!.url!,
                        ),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                  onPressed: () {
                    if (!(context.read<VotingProvider>().isFavourite)) {
                      context
                          .read<VotingProvider>()
                          .makeFavourite(voteprovider.randomCat!.id);
                    } else {
                      context
                          .read<VotingProvider>()
                          .removeFavourite(voteprovider.favId);
                    }
                  },
                  icon: context.watch<VotingProvider>().isFavourite
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 40,
                        )
                      : const Icon(
                          Icons.favorite_outline,
                          size: 40,
                          color: Colors.red,
                        )),
            )
          ],
        ),
        VotingButtons(
          imageId: voteprovider.randomCat!.id!,
        )
      ],
    );
  }
}

import 'package:cat_api_task/ui/home/providers/voting_provider.dart';
import 'package:cat_api_task/ui/home/widgets/voting_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VotingScreen extends StatelessWidget {
  const VotingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final voteprovider = Provider.of<VotingPRovider>(context);
    return Center(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        voteprovider.randomCat != null
            ? Stack(
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
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_outline,
                          size: 25,
                        )),
                  )
                ],
              )
            : Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.5,
                child: const CircularProgressIndicator()),
        const VotingButtons()
      ]),
    );
  }
}

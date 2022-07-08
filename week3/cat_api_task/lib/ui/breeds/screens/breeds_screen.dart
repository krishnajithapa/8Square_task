import 'package:cat_api_task/models/breeds.dart';
import 'package:cat_api_task/ui/breeds/providers/breeds_provider.dart';
import 'package:cat_api_task/ui/breeds/widgets/dropdown_field.dart';
import 'package:cat_api_task/ui/home/voting/widgets/cat_image_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BreedsScreen extends StatelessWidget {
  const BreedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(16),
            child: FutureBuilder(
              future: context.read<BreedsProvider>().getAllBreeds(),
              builder: (context, AsyncSnapshot<List<Breed>?> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return _getLoadingBody();
                } else {
                  if (snapshot.hasError) {
                    return _getErrorBody(context);
                  } else {
                    if (snapshot.data == null) {
                      return const Text('Error Loading Data');
                    }

                    return _breedListBody(context, snapshot.data);
                  }
                }
              },
            )),
      ),
    );
  }

  _getErrorBody(BuildContext context) {
    return Text(context.read<BreedsProvider>().errorMessage);
  }

  _breedListBody(BuildContext context, breedList) {
    return Consumer<BreedsProvider>(builder: (context, ref, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DropDownField(
            label: "Breeds",
            breedList: breedList,
            onTap: (item) {
              context.read<BreedsProvider>().changeBreed(item);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          CatInfoCard(
            ref: ref,
          )
        ],
      );
    });
  }

  Center _getLoadingBody() =>
      Center(child: Lottie.asset("assets/images/loading.json"));
}

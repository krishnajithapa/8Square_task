import 'dart:developer';

import 'package:cat_api_task/ui/home/models/breeds.dart';
import 'package:cat_api_task/ui/home/providers/breeds_provider.dart';
import 'package:cat_api_task/ui/home/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreedsScreen extends StatelessWidget {
  const BreedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("kjkdsa");
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
      log('consumer');
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
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: const Color.fromARGB(255, 247, 157, 89),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          ref.selectedBreed!.image?.url! ??
                              "https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg",
                        ),
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Text(
                        ref.selectedBreed!.name!.toUpperCase(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "id: ${ref.selectedBreed?.id!}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Description:",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        ref.selectedBreed?.description! ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ref.selectedBreed?.temperament! ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${ref.selectedBreed!.weight!.metric!} kgs",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }

  Center _getLoadingBody() => const Center(child: CircularProgressIndicator());
}

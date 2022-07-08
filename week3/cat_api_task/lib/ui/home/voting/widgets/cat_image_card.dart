import 'package:cat_api_task/ui/breeds/providers/breeds_provider.dart';
import 'package:cat_api_task/ui/breeds/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CatInfoCard extends StatelessWidget {
  const CatInfoCard({Key? key, required this.ref}) : super(key: key);
  final BreedsProvider ref;
  @override
  Widget build(BuildContext context) {
    return Card(
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
                CustomText(
                  data: ref.selectedBreed!.name!.toUpperCase(),
                  fontColor: Colors.white,
                  fontSize: 25,
                ),
                CustomText(
                    data: "id: ${ref.selectedBreed!.id}",
                    fontWeight: FontWeight.bold),
                CustomText(data: "Description:"),
                CustomText(data: ref.selectedBreed!.description!),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  data: ref.selectedBreed?.temperament! ?? "",
                  fontSize: 20,
                ),
                CustomText(
                  data: "${ref.selectedBreed!.weight!.metric!} kgs",
                  fontSize: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

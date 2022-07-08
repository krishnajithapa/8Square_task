import 'package:cat_api_task/ui/home/providers/voting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.label,
      required this.onTap,
      required this.imageId})
      : super(key: key);
  final String label;
  final Function onTap;
  final String imageId;
  bool isDisabled = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              backgroundColor: MaterialStateProperty.all(
                  label == "Upvote" ? Colors.green : Colors.red),
            ),
            onPressed: () {
              if (imageId != '') {
                context.read<VotingPRovider>().getRadomImage();
                context
                    .read<VotingPRovider>()
                    .vote(imageId, label == "Upvote" ? 1 : 0);
              }
            },
            child: Text(label)),
      ),
    );
  }
}

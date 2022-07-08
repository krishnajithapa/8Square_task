import 'package:cat_api_task/ui/voting/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class VotingButtons extends StatelessWidget {
  const VotingButtons({Key? key, required this.imageId}) : super(key: key);
  final String imageId;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          label: "Upvote",
          imageId: imageId,
        ),
        CustomButton(
          label: "DownVote",
          imageId: imageId,
        )
      ],
    );
  }
}

import 'package:cat_api_task/ui/home/providers/voting_provider.dart';
import 'package:cat_api_task/ui/home/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VotingButtons extends StatelessWidget {
  const VotingButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          label: "Upvote",
          onTap: () async {},
          imageId: context.read<VotingPRovider>().randomCat?.id! ?? "",
        ),
        CustomButton(
          label: "DownVote",
          onTap: () async {},
          imageId: context.read<VotingPRovider>().randomCat?.id ?? "",
        )
      ],
    );
  }
}

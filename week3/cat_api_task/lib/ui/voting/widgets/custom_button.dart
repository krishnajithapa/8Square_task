import 'package:cat_api_task/ui/voting/providers/voting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.label, required this.imageId})
      : super(key: key);
  final String label;
  final String imageId;
  bool isDisabled = false;
  @override
  Widget build(BuildContext context) {
    final votingProvider = Provider.of<VotingProvider>(context);
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
              context.read<VotingProvider>().getRadomImage();
              context.read<VotingProvider>().setFavourite(false);
              context
                  .read<VotingProvider>()
                  .vote(imageId, label == "Upvote" ? 1 : 0);
            },
            child: Text(label)),
      ),
    );
  }
}

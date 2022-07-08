import 'package:cat_api_task/ui/voting/providers/voting_provider.dart';
import 'package:cat_api_task/ui/voting/widgets/vote_body_loading.dart';
import 'package:cat_api_task/ui/voting/widgets/vote_cat_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VotingScreen extends StatelessWidget {
  const VotingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final voteprovider = Provider.of<VotingProvider>(context);
    return Center(
      child: !voteprovider.isLoading
          ? VoteCatBody(voteprovider: voteprovider)
          : const VoteBodyLoading(),
    );
  }
}

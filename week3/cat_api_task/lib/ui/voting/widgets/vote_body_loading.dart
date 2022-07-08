import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VoteBodyLoading extends StatelessWidget {
  const VoteBodyLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Lottie.asset("assets/images/loading.json"));
  }
}

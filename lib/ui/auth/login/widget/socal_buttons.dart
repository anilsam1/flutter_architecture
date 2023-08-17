import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';

class SocalButtns extends StatelessWidget {
  const SocalButtns({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: () {}, icon: Image.asset(Assets.imageFb)),
        IconButton(onPressed: () {}, icon: Image.asset(Assets.imageLinkedin)),
        IconButton(onPressed: () {}, icon: Image.asset(Assets.imageTwitter)),
      ],
    );
  }
}

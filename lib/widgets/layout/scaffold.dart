import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../constants/constants.dart';

class SScaffold extends StatelessWidget {
  final Widget body;
  final bool resizeToAvoidBottomInset;

  const SScaffold(
    {
      super.key,
      required this.body,
      this.resizeToAvoidBottomInset = true,
    }
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    body: SafeArea(
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const RiveAnimation.asset(
              background,
              fit: BoxFit.cover,
            ),
          ),
          Opacity(
            opacity: .8,
            child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: body
          ),
        ],
      ),
    ),
  );
}

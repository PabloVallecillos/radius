import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../constants/constants.dart';

class UnAuthScaffold extends StatelessWidget {
  final Widget body;
  final bool resizeToAvoidBottomInset;

  const UnAuthScaffold(
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
              backgroundRiv,
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
          Center(
            child: Padding(
              padding: defaultPadding,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: OrientationBuilder(
                  builder: (BuildContext context, Orientation orientation)
                    => orientation == Orientation.landscape
                        ? SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: body,
                        )
                        : body,
                )
              )
            ),
          ),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

class AuthScaffold extends StatelessWidget {
  final Widget body;

  const AuthScaffold(
    {
      super.key,
      required this.body,
    }
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Padding(
        padding: defaultPadding,
        child: body,
      )
    ),
  );
}

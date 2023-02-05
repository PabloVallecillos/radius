import 'package:flutter/material.dart';

class SScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;

  const SScaffold(
    {
      super.key,
      required this.body,
      this.floatingActionButton,
    }
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: body,
      ),
    ),
    floatingActionButton: floatingActionButton,
  );
}

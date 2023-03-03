import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../extensions/string.dart';

class RowAvatar extends StatelessWidget {
  const RowAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateFormat dayFormatter = DateFormat('dd', 'es');
    final DateFormat monthFormatter = DateFormat('MMMM', 'es');
    final String day = dayFormatter.format(now);
    final String month = monthFormatter.format(now);

    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: NetworkImage('https://picsum.photos/200'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('User'),
            Text('$day ${month.capitalize()}'),
          ],
        )
      ],
    );
  }
}

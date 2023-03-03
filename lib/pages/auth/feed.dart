import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:radius/constants/assets.dart';
import 'package:radius/extensions/string.dart';

import '../../widgets/layout/auth/cards/photo.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({
    super.key,
  });

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final ScrollController _controller = ScrollController();

  final List<Widget> _items = [];

  // Future<int> _getItems() async {
  //   await Future<void>.delayed(Duration(seconds: 1));
  //   _items.
  // }

  @override
  void initState() {
    // _controller.addListener(() {
    //   if (_controller.position.maxScrollExtent == _controller.offset && _hasItems) {
    //     _getItems();
    //   }
    // });
    super.initState();
    // _getItems();
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) => CustomScrollView(
    slivers: [

      /// histories
      SliverToBoxAdapter(
        child: Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 100.0,
                child: Card(
                  child: Text('data'),
                ),
              );
            },
          ),
        ),
      ),

      /// photos
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: PhotoCard(),
            );
          },
          childCount: 3,
        )
      ),

      /// histories
      SliverToBoxAdapter(
        child: Container(
          height: 100.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 100.0,
                child: Card(
                  child: Text('data'),
                ),
              );
            },
          ),
        ),
      ),

    ],
  );
}
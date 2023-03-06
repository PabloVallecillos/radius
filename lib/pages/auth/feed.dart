import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:radius/constants/assets.dart';

import '../../widgets/layout/auth/avatars/row_avatar.dart';
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
  Widget build(BuildContext context) {
    final bool darkMode = Theme.of(context).brightness == Brightness.dark;
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: 20,),
        ),
        /// histories
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Stack(
              children: [
                Center(
                  child: Transform.translate(
                    offset: Offset(8,18),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 65,
                      height: 547.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: darkMode ? Colors.white : Colors.black,
                        ),
                        color: darkMode ? Colors.white.withOpacity(.05) : Colors.black.withOpacity(.05)
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Transform.translate(
                      offset: Offset(-8,0),
                      child: Container(
                        height: 500,
                        width: MediaQuery.of(context).size.width - 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: 270.0,
                                child: Padding(
                                  padding: EdgeInsets.only(right: index == 4 ? 0 : 14),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    child: Image.network(
                                      'https://picsum.photos/1080',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, 12),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 35, right: 13),
                        child: Row(
                          children: [
                            const RowAvatar(),
                            const Spacer(),
                            SvgPicture.asset(loveSvg, color: darkMode ? Colors.white : Colors.black),
                            const Icon(Icons.more_vert_outlined),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
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

        const SliverToBoxAdapter(
          child: SizedBox(height: 20,),
        ),
      ],
    );
  }
}
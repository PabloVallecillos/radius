import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';
import 'feed.dart';

class DashboardPage extends StatefulWidget  {
  const DashboardPage(
    {
      super.key
    }
  );

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currIndex = 2;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this, initialIndex: 2);
    _tabController.addListener(() {
      setState(() {
        _currIndex = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool darkMode = Theme.of(context).brightness == Brightness.dark;
    return DefaultTabController(
      length: 5,
      initialIndex: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.translate(
                  offset: Offset(-5, -15),
                  child: Transform.scale(
                    scale: .83,
                    child: SvgPicture.asset(radiusSvg, width: 48)
                  ),
                ),
                Theme(
                  data: ThemeData(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                  child: Row(
                    children: [
                      TabBar(
                        indicator: CircleTabIndicator(color: Colors.white, radius: 8),
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.symmetric(horizontal: 5),
                        isScrollable: true,
                        labelStyle: TextStyle(color: Colors.transparent),
                        controller: _tabController,
                        tabs: List<Widget>.generate(5, (int index) => Tab(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(color: Colors.white)
                            ),
                            width: 12,
                            height: 12,
                          )
                        )),
                      ),
                    ],
                  )
                ),
                Transform.translate(
                  offset: Offset(0, -15),
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    mini: true,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.white
                      ),
                      borderRadius: BorderRadius.circular(100)
                    ),
                    onPressed: () {
                    },
                    child: Icon(Icons.expand_less_sharp),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              FeedPage(),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({
    required Color color,
    required double radius,
  }) : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius) : _paint = Paint()..color = color..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset = offset + Offset((cfg.size?.width ?? 0) / 2, (cfg.size?.height ?? 0) - radius - 17);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}

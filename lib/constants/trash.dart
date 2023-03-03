import 'package:flutter/material.dart';

import '../pages/auth/feed.dart';
import 'constants.dart';

class TrashPage extends StatefulWidget {
  const TrashPage({super.key});

  @override
  State<TrashPage> createState() => _TrashPageState();
}

class _TrashPageState extends State<TrashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool darkMode = Theme.of(context).brightness == Brightness.dark;
    return DefaultTabController(
      length: 7,
      child: Scaffold(

        /// https://blog.logrocket.com/flutter-tabbar-a-complete-tutorial-with-examples/ vertically scrollable hide tabar when scroll down and show whe
        appBar: AppBar(
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.star_outline),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.query_stats),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 15),
              child: Icon(Icons.notifications_outlined),
            ),
          ],
          title: const CircleAvatar(
            radius: 18,
            backgroundColor: primary,
            child: Center(
                child: Text('PV', style: TextStyle(color: Colors.white),)),
          ),
        ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context,
              bool innerBoxIsScrolled) =>
          [
            SliverAppBar(
              floating: true,
              automaticallyImplyLeading: false,
              toolbarHeight: 0,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Theme(
                  data: ThemeData(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: darkMode ? Colors.white12 : Colors.black12,
                      // border: Border.all(
                      //   color: Colors.white
                      // ),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                    ),
                    labelColor: darkMode ? Colors.white : Colors.black,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.normal
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    isScrollable: true,
                    tabs: const <Widget>[
                      Tab(
                        text: 'Feed',
                      ),
                      Tab(child: Text("Amigos")),
                      Tab(child: Text("Historias")),
                      Tab(child: Text("Historias")),
                      Tab(child: Text("Historias")),
                      Tab(child: Text("Historias")),
                      Tab(child: Text("Historias")),
                    ],
                  ),
                ),
              ),
            ),
          ],
          body: SafeArea(
            child: TabBarView(
              children: <Widget>[
                FeedPage(),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

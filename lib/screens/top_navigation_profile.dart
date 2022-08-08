import 'package:flutter/material.dart';
import 'package:haveloc/screens/profile/applied.dart';
import 'package:haveloc/screens/profile/feedback.dart';
import 'package:haveloc/screens/profile/invited.dart';
import 'package:haveloc/screens/profile/overview.dart';
import 'package:haveloc/screens/profile/placed.dart';
import 'package:haveloc/screens/profile/tracker.dart';

class ProfileNavigation extends StatefulWidget {
  @override

  State<ProfileNavigation> createState() => _ProfileNavigationState();
}

class _ProfileNavigationState extends State<ProfileNavigation> with TickerProviderStateMixin {
  // TabController controller;
  // @override
  // void initState() {
  //   super.initState();
  //   controller = TabController(vsync: this, length: 2);
  // }
  //
  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {

    final title = 'haveloc';
    const color = const Color(0xff0da8ef);
    final List<String> _tabs = <String>['Overview', 'Applied','Tracker', 'Invited','Placed','Feedbacks'];
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.menu_rounded),
                        iconSize: 27,
                        color: Colors.black,
                        tooltip: 'Comment Icon',
                        padding: EdgeInsets.only(right: 20,top: 10),
                        constraints: BoxConstraints(),
                        onPressed: (){
                        },
                      ),
                    ],
                    expandedHeight: 110,
                    title: Padding(
                      padding: const EdgeInsets.only(top: 10,left:8),
                      child: Text(title,
                          style: const TextStyle(

                            fontSize: 27,
                            color: color,
                          ) //TextStyle
                      ),
                    ),
                    backgroundColor: Colors.white,
                    floating: true,
                    pinned: true,
                    elevation: 10,
                    snap: true,
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      isScrollable: true,
                      padding: const EdgeInsets.only(left:10,right: 10),
                      indicatorColor: Colors.grey,
                      indicatorPadding: EdgeInsets.all(2),
                      indicatorWeight: 1,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.black,

                      unselectedLabelColor: Colors.grey,
                      tabs: _tabs.map((String name) => Tab(text: name)).toList(),

                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                StudentOverview(),
                StudentApplied(),
                StudentTracker(),
                StudentInvited(),
                StudentPlaced(),
                StudentFeedbacks(),
              ],
            ),
          )),
    );
  }
}

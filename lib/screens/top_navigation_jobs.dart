import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haveloc/screens/home/interns.dart';

import 'home/fulltime.dart';

class JobNavigation extends StatefulWidget {
  @override

  State<JobNavigation> createState() => _JobNavigationState();
}

class _JobNavigationState extends State<JobNavigation> with TickerProviderStateMixin {
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
    const blueee = const Color(0xff0da8ef);
    final List<String> _tabs = <String>['Full Time', 'Interns'];
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
                ], //<Widget>[]
                expandedHeight: 110,
                title: Padding(
                  padding: const EdgeInsets.only(left: 8,top: 10),
                  child: Text(title,
                      style: const TextStyle(
                        fontSize: 27,
                        color: blueee,
                      ) //TextStyle
                      ),
                ),
                backgroundColor: Colors.white,
                floating: true,
                pinned: true,
                elevation: 1.0,
                shape: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
                snap: true,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  indicatorColor: Color(0xff0da8ef),
                  indicatorPadding: EdgeInsets.only(left:45,right: 45),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Color(0xff0da8ef),
                  indicatorWeight: 3,
                  unselectedLabelColor: Colors.grey,
                  tabs: _tabs.map((String name) => Tab(child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),)).toList(),

                ),

              ),
            ),
            // createSilverAppBar2()
          ];
        },
        body: const Padding(
          padding: EdgeInsets.only(top: 55.0),
          child: TabBarView(
            children: <Widget>[
               FullTimew(),
              Interns(),
            ],
          ),
        ),
      )),
    );
  }
}
// SliverAppBar createSilverAppBar2() {
//   return SliverAppBar(
//     backgroundColor: Colors.redAccent,
//     pinned: true,
//     title: Container(
//       margin: EdgeInsets.symmetric(horizontal: 10),
//       height: 40,
//       decoration: BoxDecoration(
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//               color: Colors.grey.withOpacity(0.6),
//               offset: const Offset(1.1, 1.1),
//               blurRadius: 5.0),
//         ],
//       ),
//       child: CupertinoTextField(
//         // controller: _filter,
//         keyboardType: TextInputType.text,
//         placeholder: 'Search',
//         placeholderStyle: TextStyle(
//           color: Color(0xffC4C6CC),
//           fontSize: 14.0,
//           fontFamily: 'Brutal',
//         ),
//         prefix: Padding(
//           padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
//           child: Icon(
//             Icons.search,
//             size: 18,
//             color: Colors.black,
//           ),
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8.0),
//           color: Colors.white,
//         ),
//       ),
//     ),
//   );
// }

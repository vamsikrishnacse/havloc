import 'package:flutter/material.dart';

import 'companies.dart';

class FullTimeScreen extends StatefulWidget {

  final int id;
  const FullTimeScreen(this.id);

  @override
  State<FullTimeScreen> createState() => _FullTimeScreenState();
}

class _FullTimeScreenState extends State<FullTimeScreen> {
  final List<Map> myProducts =
  List.generate(100000, (index) => {"id": index, "name": "Product $index"})
      .toList();
  @override
  Widget build(BuildContext context) {
    // final title = 'haveloc';
    // const blueee = const Color(0xff0da8ef);
    // final List<String> _tabs = <String>['Full Time', 'Interns'];
    return  Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  leading:   Padding(
                    padding:  const EdgeInsets.fromLTRB(18,14,5,8),
                    child:  IconButton(
                      icon: const Icon(Icons.arrow_back,size: 25,),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  expandedHeight: 60,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 8,top: 10),
                    child: Text(widget.id.toString(),
                        style: const TextStyle(
                          fontSize: 27,
                          color: Colors.black,
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

                ),
              ),
              // createSilverAppBar2()
            ];
          },
          body:  Padding(
              padding: EdgeInsets.only(top: 55.0),
              child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          // implement GridView.builder
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 4 / 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15),
              itemCount: myProducts.length,
              itemBuilder: (BuildContext ctx, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: Colors.grey, width: 0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(

                    alignment: Alignment.center,
                    decoration: BoxDecoration(

                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child:
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10,10,8,8),
                          child: Text(myProducts[index]["name"]),
                        ),
                      )
                  ),
                );
              }),
        ),
      )
          ),
        ));
  }
}

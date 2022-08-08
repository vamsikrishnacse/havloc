import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:haveloc/models/fulltime_model.dart';
import 'package:haveloc/widget/Fulltime/searchbar_fulltime.dart';
import 'package:provider/provider.dart';
import 'package:haveloc/provider/fulltime_provider.dart';

class ListViewFullTime extends StatefulWidget {
  @override
  State<ListViewFullTime> createState() => _ListViewFullTimeState();
}

class _ListViewFullTimeState extends State<ListViewFullTime> {
  var _isInit =true;
  bool hasmore =true;
  int pageno =0;
  bool isloading = false;
  late BuildContext _buildContext;
  List _posts = [];
  final controller =ScrollController();
  FulltimeProvider _userList = FulltimeProvider();

  Future<void> _refresh(BuildContext context) async {
    setState((){
     isloading = false;
     hasmore =true;
     pageno = 0;
     _posts.clear();
    });
    await Provider.of<FulltimeProvider>(context, listen: false).getData();
  }

  @override
  void initState() {
    controller.addListener(() {
      fetch1();
      if(controller.position.maxScrollExtent == controller.offset){
        fetch();
      }

    });
    super.initState();

  }
  Future fetch1() async {
    if(isloading) return;
    isloading =true;
    final productsDatap1 =
    Provider.of<FulltimeProvider>(_buildContext, listen: false);
    final List fetchedPosts = productsDatap1.full;
    setState((){
      pageno++;
      isloading =false;
      _posts.addAll(fetchedPosts);
    });
  }

  Future fetch() async{
    if(isloading) return;
    isloading =true;
    final productsDatap =
    Provider.of<FulltimeProvider>(_buildContext, listen: false);
    final productsp = productsDatap.pages;
    final int limit =productsp.size;
    print("in");
    final productsDatal =
    Provider.of<FulltimeProvider>(_buildContext, listen: false);
    final products = productsDatal.linkes;
    print(products);
    await Provider.of<FulltimeProvider>(_buildContext, listen: false).getlist(products.next);
    final productsDatal2 =
    Provider.of<FulltimeProvider>(_buildContext, listen: false);
    final List fetchedPosts = productsDatal2.full;
    setState((){
      pageno++;
      isloading =false;
      if(fetchedPosts.length<limit){
        hasmore =false;

      }
      _posts.addAll(fetchedPosts);
    });
  }

  @override
  void dispose() {
controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final productsData = Provider.of<FulltimeProvider>(context);
    _buildContext =context;

    return RefreshIndicator(
      onRefresh: () => _refresh(context),
      child: SingleChildScrollView(
        controller: controller,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(18, 0, 5, 0),
                        child: SearchBar(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 8, 15, 8),
                      child: Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.grey[600],
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: _posts.isEmpty
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : ListView.builder(

                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: _posts.length+1,
                  itemBuilder: (context, index) {
                    if (index<_posts.length) {
                      return Padding(
                          padding:
                          const EdgeInsets.fromLTRB(10, 0, 10, 0.5),
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.grey, width: 0.4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 5,
                            ),
                            child: Container(
                              padding:
                              const EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(_posts[index].jobtitle,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 8, 8, 8),
                                    child: Text(_posts[index].companyname,
                                        style:
                                        const TextStyle(fontSize: 18)),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(0, 8, 8, 4),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.grey[600],
                                          size: 17,
                                        ),
                                        Text(
                                          _posts[index].location,
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(0, 6, 8, 4),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.currency_rupee,
                                          color: Colors.grey[600],
                                          size: 17,
                                        ),
                                        Text(
                                          "CTC :  ",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 15),
                                        ),
                                        Text(
                                          '\u{20B9}${_posts[index].maxctc}',
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(0, 4, 8, 8),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.calendar_month_rounded,
                                          color: Colors.grey[600],
                                          size: 17,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10)),
                                          child: Text(
                                            " Apply By  :  ",
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 15),
                                          ),
                                        ),
                                        Text(
                                          _posts[index].jobapplyby,
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 12, 8, 4),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _posts[index].jobstatus,
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 15),
                                        ),
                                        Text(
                                          _posts[index]
                                              .appliedCount
                                              .toString() +
                                              "  Applicants",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ));
                    }
                    else {
                      return  Padding(padding: const EdgeInsets.symmetric(vertical: 32),
                      child:
                      Center(
                          child: hasmore
                          ? CircularProgressIndicator():
                         const Text('no more'),),
                      );
                    }
                }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

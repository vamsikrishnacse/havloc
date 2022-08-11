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
  FulltimeProvider _userList = FulltimeProvider();

  Future<void> _refresh(BuildContext context) async {
    _posts.clear();
    // There is next page or not
    _hasNextPage = true;

    // Used to display loading indicators when _firstLoad function is running
    _isFirstLoadRunning = false;

    // Used to display loading indicators when _loadMore function is running
    _isLoadMoreRunning = false;
    links.clear();
    pages.clear();
    _posts = await Provider.of<FulltimeProvider>(context, listen: false).getData();
    setState((){

    });
  }

  // Future<void> _firstloadl(BuildContext context) async {
  //
  //   final links = productsData.linkes;
  //   final page = productsData.pages;
  // }

  // At the beginning, we fetch the first 20 posts
  int _page = 0;

  // you can change this value to fetch more or less posts per page (10, 15, 5, etc)
  final int _limit = 20;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // This holds the posts fetched from the server
  List<FullTimee> _posts = [];
  List links = [];
  List pages = [];
  late BuildContext _buildContext;

  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    print("exec");
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final productsData =
      await Provider.of<FulltimeProvider>(context, listen: false).getData();
      // print(products);
      setState(() {
        _posts.clear();
        _posts.addAll(productsData);
        print(_posts);
        print('in');
      });
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
        print(err);
      }
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 320) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        print("in");
        final productsDatal =
        Provider.of<FulltimeProvider>(context, listen: false);
        final products = productsDatal.linkes;
        print(products);
        await Provider.of<FulltimeProvider>(context, listen: false)
            .getlist(products.next);
        final productsDatal2 =
        Provider.of<FulltimeProvider>(context, listen: false);
        final List<FullTimee> fetchedPosts = productsDatal2.full;

        if (fetchedPosts.isNotEmpty) {
          setState(() {
            print('Body: $fetchedPosts');
            _posts.addAll(fetchedPosts);
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view

  // The controller for the ListView
  late ScrollController _controller;
  var _isInit = true;

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //
  //     Provider.of<FulltimeProvider>(context).getData();
  //
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  //   _firstLoad();
  //   _controller = ScrollController()..addListener(_loadMore);
  // }
  @override
  void initState() {

    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<FulltimeProvider>(context, listen: false).getData();
    //   //
    //   // _buildContext = context;
    //     });

    super.initState();
    _controller = ScrollController()..addListener(_loadMore);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _firstLoad();
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // @override
    // void didChangeDependencies() {
    //   if (_isInit) {
    //     Provider.of<FulltimeProvider>(context).getData();
    //   }
    //   _isInit = false;
    //   super.didChangeDependencies();
    // }

    // setState(() {
    //   _isFirstLoadRunning = true;
    // });
    // if (_isFirstLoadRunning == true) {
    //   final productsData = Provider.of<FulltimeProvider>(context);
    //   _buildContext = context;
    //   final products = productsData.full;
    //   // print(products);
    //   setState(() {
    //     _posts = products;
    //     print("_posts");
    //     print(_posts);
    //     // print('in');
    //     _isFirstLoadRunning = false;
    //   });
    // }

    // setState(() {
    //
    // });

    return  RefreshIndicator(
      onRefresh: () => _refresh(context),
      child: SingleChildScrollView(
        controller: _controller,
        child: Column(
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
                child:_isFirstLoadRunning
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (_, index) {
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
                  },
                ),
              ),
            ),
            // when the _loadMore function is running
            if (_isLoadMoreRunning == true)
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 40),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            // When nothing else to load
            if (_hasNextPage == false)
              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 40),
                color: Colors.amber,
                child: const Center(
                  child: Text('You have fetched all of the content'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

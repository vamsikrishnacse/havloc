import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../../provider/intern_provider.dart';
import '../Fulltime/searchbar_fulltime.dart';

class ListViewintern extends StatefulWidget {
  const ListViewintern({Key? key}) : super(key: key);

  @override
  State<ListViewintern> createState() => _ListViewinternState();
}

class _ListViewinternState extends State<ListViewintern> {
  Future<void> _refresh(BuildContext context) async {
    await Provider.of<InternProvider>(context, listen: false).getData();
  }
  @override
  Widget build(BuildContext context) {
      final productsData = Provider.of<InternProvider>(context);

      final posts = productsData.full;
    return RefreshIndicator(
      onRefresh: () => _refresh(context),
      child: SingleChildScrollView(
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
                child:posts.isEmpty
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: posts.length,
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
                                Text(posts[index].jobtitle,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 8, 8, 8),
                                  child: Text(posts[index].companyname,
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
                                        posts[index].location,
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
                                        '\u{20B9}${posts[index].maxctc}',
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
                                        posts[index].jobapplyby,
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
                                        posts[index].jobstatus,
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 15),
                                      ),
                                      Text(
                                        posts[index]
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
            // if (_isLoadMoreRunning == true)
            //   const Padding(
            //     padding: EdgeInsets.only(top: 10, bottom: 40),
            //     child: Center(
            //       child: CircularProgressIndicator(),
            //     ),
            //   ),
            // // When nothing else to load
            // if (_hasNextPage == false)
            //   Container(
            //     padding: const EdgeInsets.only(top: 30, bottom: 40),
            //     color: Colors.amber,
            //     child: const Center(
            //       child: Text('You have fetched all of the content'),
            //     ),
            //   ),
          ],
        ),
      ),
    );;
  }
}

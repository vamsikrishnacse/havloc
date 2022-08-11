import 'package:flutter/material.dart';
import 'package:haveloc/models/fulltime_model.dart';

import '../../provider_search_fultime/search_fulltime_api.dart';



class SearchUser extends SearchDelegate<String> {
  FulltimeList _userList = FulltimeList(); //provider

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<FullTimee>>(
        future: _userList.getList(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<FullTimee>? data = snapshot.data;
          return Padding(
            padding: const EdgeInsets.only(top:25.0),
            child: ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      children: [
                        // Container(
                        //   width: 60,
                        //   height: 60,
                        //   decoration: BoxDecoration(
                        //     color: Colors.deepPurpleAccent,
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        //   child: Center(
                        //     child: Text(
                        //       '${data[index].jobtitle}',
                        //       style: TextStyle(
                        //           fontSize: 20,
                        //           fontWeight: FontWeight.bold,
                        //           color: Colors.white),
                        //       overflow: TextOverflow.clip,
                        //     ),
                        //   ),
                        // ),
                        SizedBox(width: 20),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 350,
                                child: Text(
                                  '${data?[index].jobtitle}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  softWrap: false,
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${data?[index].companyname}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ])
                      ],
                    ),
                  );
                }),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search Full Time'),
    );
  }
}

//
//
// @override
// List<Widget> buildActions(BuildContext context) {
//   return [
//     IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: Icon(Icons.clear))
//   ];
// }
//
// @override
// Widget buildLeading(BuildContext context) {
//   return IconButton(
//     icon: Icon(Icons.arrow_back_ios),
//     onPressed: () {
//       Navigator.pop(context);
//     },
//   );
// }
//
// @override
// Widget buildResults(BuildContext context) {
//   return FutureBuilder<List<FullTimee>>(
//       future: _userList.getList(query: query),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         List<FullTimee> data = snapshot.data;
//         return ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Row(
//                   children: [
//                     // Container(
//                     //   width: 60,
//                     //   height: 60,
//                     //   decoration: BoxDecoration(
//                     //     color: Colors.deepPurpleAccent,
//                     //     borderRadius: BorderRadius.circular(10),
//                     //   ),
//                     //   child: Center(
//                     //     child: Text(
//                     //       '${data[index].jobtitle}',
//                     //       style: TextStyle(
//                     //           fontSize: 20,
//                     //           fontWeight: FontWeight.bold,
//                     //           color: Colors.white),
//                     //       overflow: TextOverflow.clip,
//                     //     ),
//                     //   ),
//                     // ),
//                     SizedBox(width: 20),
//                     Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '${data[index].jobtitle}',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.w600),
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             '${data[index].companyname}',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ])
//                   ],
//                 ),
//               );
//             });
//       });
// }
//
// @override
// Widget buildSuggestions(BuildContext context) {
//   return Center(
//     child: Text('Search User'),
//   );
// }

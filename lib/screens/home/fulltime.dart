import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:haveloc/provider/fulltime_provider.dart';
import '../../widget/Fulltime/fullscreen_listview.dart';

class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      home: FullTimew(),
    );
  }
}
class FullTimew extends StatefulWidget {
   const FullTimew({ Key? key}) : super(key: key);

  @override
  FullTimewState createState() => FullTimewState();
}

class FullTimewState extends State {
  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<FulltimeProvider>(context);
    // final products = productsData.full;
    // List<FulltimeProvider> _foundlist = [];
    // @override
    // initState() {
    //   // at the beginning, all users are shown
    //   _foundlist = products.cast<FulltimeProvider>();
    //   super.initState();
    // }
    // void _runFilter(String enteredKeyword) {
    //   List<FulltimeProvider> results = [];
    //   if (enteredKeyword.isEmpty) {
    //     // if the search field is empty or only contains white-space, we'll display all users
    //     results = products.cast<FulltimeProvider>();
    //   } else {
    //     results = products
    //         .where((company) =>
    //         company[com].toLowerCase().contains(enteredKeyword.toLowerCase())).cast<FulltimeProvider>()
    //         .toList();
    //     // we use the toLowerCase() method to make it case-insensitive
    //   }
    //
    //   // Refresh the UI
    //   setState(() {
    //     _foundUsers = results;
    //   });
    // }

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body:  ListViewFullTime(),
    );
  }
}






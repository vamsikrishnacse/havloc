import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haveloc/screens/top_navigation_jobs.dart';
import 'package:provider/provider.dart';

import '../provider/fulltime_provider.dart';

class Jobs extends StatefulWidget {


  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  var _isInit =true;
  // // @override
  // // void initState() {
  // //
  // //   Future.delayed(Duration.zero).then((_) {
  // //     Provider.of<FulltimeProvider>(context).getData();
  // //   });
  // //   super.initState();
  // // }
  //
  @override
  void didChangeDependencies() {
    if (_isInit) {

      Provider.of<FulltimeProvider>(context).getData();
    }
    _isInit = false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JobNavigation(),
    );}
}

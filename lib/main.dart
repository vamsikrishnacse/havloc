import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../screens/bottom_navigation.dart';
import './provider/fulltime_provider.dart';


Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, //or set color with: Color(0xFF0000FF)
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FulltimeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'haveloc',

        home: TabsScreen(),

      ),
    );
  }
}

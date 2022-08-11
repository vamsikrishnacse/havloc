import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haveloc/provider/intern_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: FulltimeProvider(),
        ),
        ChangeNotifierProvider.value(
          value: InternProvider(),
        ),
        // ChangeNotifierProvider.value(
        //   value: Orders(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'haveloc',

        home: TabsScreen(),

      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_advance_flutter_exam/provider/HomeProvider.dart';
import 'package:re_advance_flutter_exam/views/cartScreen.dart';
import 'package:re_advance_flutter_exam/views/detailScreen.dart';
import 'package:re_advance_flutter_exam/views/homeScreen.dart';
import 'package:re_advance_flutter_exam/views/splashScreen.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Homeprovider(),
      builder: (context, child) =>MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>Splashscreen(),
          '/home':(context)=>Homescreen(),
          '/deat':(context)=>Detailscreen(),
          '/cart':(context)=>Cartscreen()
        },
      ),
    );
  }
}

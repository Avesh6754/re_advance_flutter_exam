import 'dart:async';

import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 3),(timer) {
      Navigator.of(context).pushReplacementNamed('/home');
    },);
    return Scaffold(
      body: Center(
child:Container(

  decoration: BoxDecoration(
    color: Colors.white,
    image: DecorationImage(

      image: AssetImage('assets/image/7938113.jpg')
    )
  ),
)),
    );
  }
}

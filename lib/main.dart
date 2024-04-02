import 'package:flutter/material.dart';
import 'package:mahabharat_app/utils/route_utils.dart';
import 'package:mahabharat_app/view/screen/detial_page.dart';
import 'package:mahabharat_app/view/screen/favourite_page.dart';
import 'package:mahabharat_app/view/screen/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoute.homepage: (context) => const HomePage(),
        MyRoute.detialpage: (context) => const DetialPage(),
        MyRoute.favouritepage: (context) => const FavouritePge(),
      },
    );
  }
}

import 'package:flutter/material.dart';

class SlowTransitionRoute extends MaterialPageRoute {
  SlowTransitionRoute({required super.builder});

  @override
  Duration get transitionDuration => const Duration(seconds: 1);
}

class MyRoute {
  static String homepage = '/';
  static String detialpage = 'detial_page';
  static String favouritepage = 'favourite_page';
}

import 'package:flutter/material.dart';

class MyApplicationPage extends StatefulWidget {
  static const routeName = '/MyApplicationPage';
  const MyApplicationPage({Key? key}) : super(key: key);

  @override
  State<MyApplicationPage> createState() => _MyApplicationPageState();
}

class _MyApplicationPageState extends State<MyApplicationPage> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

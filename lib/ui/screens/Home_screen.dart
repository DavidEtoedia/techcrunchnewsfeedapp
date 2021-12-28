import 'package:flutter/material.dart';
import 'package:food_app/ui/screens/live_news.dart';
import 'package:food_app/ui/screens/news_tabs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80,
            width: 200,
          ),
          // Container(
          //   height: 40,
          //   width: 350,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       color: Colors.grey[200]),
          // ),
          LiveNews(),
          SelectionTab()
        ],
      ),
    );
  }
}

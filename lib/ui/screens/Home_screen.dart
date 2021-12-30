import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/ui/screens/live_news.dart';
import 'package:food_app/ui/screens/news_tabs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          // Container(
          //   height: 40,
          //   width: 350,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       color: Colors.grey[200]),
          // ),
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child: Text(
              'Explore today\'s\nworld news',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          LiveNews(),
          SelectionTab()
        ],
      ),
    );
  }
}

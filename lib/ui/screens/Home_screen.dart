import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/ui/screens/live_news.dart';
import 'package:food_app/ui/screens/news_tabs.dart';
import 'package:food_app/ui/widgets/country_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        context: context,
                        builder: (context) {
                          return Column(
                            // mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 24),
                                child: Text(
                                  'Select a country and get the\nlatest news update',
                                  style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              CountryList(),
                            ],
                          );
                        });
                  },
                  child: Icon(
                    Icons.settings_outlined,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child: Text(
              'Explore today\'s\nworld news',
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600),
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

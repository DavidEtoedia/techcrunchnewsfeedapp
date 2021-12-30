import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:food_app/ui/widgets/business_tab.dart';
import 'package:food_app/ui/widgets/news_display_screen.dart';
import 'package:food_app/ui/widgets/sport_tab.dart';
import 'package:food_app/ui/widgets/tech_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectionTab extends HookConsumerWidget {
  const SelectionTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _tabController = useTabController(initialLength: 4);

    return SafeArea(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: const Color(0xffe8e8e8),
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 21.w, right: 18.w),
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                child: TabBar(
                  isScrollable: false,
                  controller: _tabController,
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  unselectedLabelStyle: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  unselectedLabelColor: Colors.black,
                  labelPadding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsets.zero,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: Colors.lightBlueAccent,
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        'All',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Tech News',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Sports',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Business',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 400.h,
                // color: Colors.grey,
                child: TabBarView(controller: _tabController, children: [
                  NewsList(),
                  TechTab(),
                  SportTab(),
                  BusinessTab()

                  // TechTab(),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/services/api/Model/news_model.dart';
import 'package:food_app/core/services/api/Model/news_category.dart';
import 'package:food_app/ui/vm/sport_vm.dart';
import 'package:food_app/ui/vm/tech_category.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'component/loading.dart';

class SportTab extends HookConsumerWidget {
  const SportTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(sportProvider);
    return vm.when(
      idle: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (Object error, StackTrace stackTrace) {
        return Center(
            child: Container(
                margin: EdgeInsets.only(left: 35, right: 35),
                child: Text(error.toString())));
      },
      success: (value) {
        return RefreshIndicator(
          onRefresh: () async {
            return ref.refresh(sportProvider);
          },
          child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              itemCount: value!.articles!.length,
              itemBuilder: (context, index) {
                final tech = value.articles![index];
                return SportTabBuild(article: tech);
              }),
        );
      },
    );
  }
}

class SportTabBuild extends HookConsumerWidget {
  final NewsCategory article;
  const SportTabBuild({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final espn = useState('assets/images/espn.png');
    final skImage = useState('assets/images/Sk.png');
    final foxSportImage = useState('assets/images/FoxSports.png');
    final sportImage = useState('assets/images/sportStar.png');
    final independentImage = useState('assets/images/independent.png');
    final esImage = useState('assets/images/Es.png');
    final fbImage = useState('assets/images/Football.png');
    String sourceDisplay() {
      // var timeNow = DateTime.now().hour;

      if (article.source == "ESPN") {
        return espn.value;
      }
      if (article.source == 'Essentially Sports') {
        return esImage.value;
      }
      if (article.source == "Football Italia") {
        return fbImage.value;
      }
      if (article.source == "Sportstar Live") {
        return sportImage.value;
      }
      if (article.source == "The Independent - Sports") {
        return independentImage.value;
      }
      if (article.source == "FOX News - Sports") {
        return foxSportImage.value;
      }
      if (article.source == "Sportskeeda") {
        return skImage.value;
      } else {
        return sportImage.value;
      }
    }

    String sourceName() {
      // var timeNow = DateTime.now().hour;

      if (article.source!.name == 'NBCSports.com') {
        return 'NBC Sports';
      }

      if (article.source!.name == "Prideofdetroit.com") {
        return 'Prideofdetroit';
      }
      if (article.source!.name == "Behind the Steel Curtain") {
        return 'BSC';
      }
      if (article.source!.name == "FOX News - Sports") {
        return 'FOX Sport';
      } else {
        return article.source!.name.toString();
      }
    }

    final newText = article.title;
    final maxline = 5;
    //     var dateTimer = DateTime.now();
    DateTime pubDate = article.publishedAt!;
    String formatted = DateFormat('h').format(pubDate);

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[100],
          ),
          // padding: EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: CachedNetworkImage(
                    height: 140,
                    width: 140,
                    errorWidget: (context, url, error) => Image.asset(
                          'assets/images/noImage.png',
                          width: 20,
                          height: 20,
                        ),
                    placeholder: (context, url) => Loading(),
                    imageUrl: article.urlToImage.toString()),
              ),
              Gap(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 170,
                        margin: EdgeInsets.only(
                          top: 25.h,
                        ),
                        child: newText!.length > maxline
                            ? Text(
                                article.title.toString(),
                                maxLines: 4,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                    height: 1.2,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              )
                            : Text(
                                article.title.toString(),
                                maxLines: 4,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                    height: 1.2,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              )),
                    Gap(10),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            sourceDisplay(),
                            width: 15,
                            height: 15,
                          ),
                          Gap(10),
                          Expanded(
                            child: Container(
                              width: 100,
                              child: Text(
                                sourceName(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            '${formatted} hour ago',
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Image.asset(
                    //       sourceDisplay(),
                    //       width: 15,
                    //       height: 15,
                    //     ),
                    //     Gap(6),
                    //     Text(
                    //       sourceName(),
                    //       style: TextStyle(
                    //           fontSize: 13.sp, fontWeight: FontWeight.w400),
                    //     ),
                    //     Gap(15),
                    //     Text(
                    //       '${formatted} hour ago',
                    //       style: TextStyle(
                    //           fontSize: 13.sp, fontWeight: FontWeight.w400),
                    //     ),
                    //     // Container(
                    //     //   // color: Colors.red,
                    //     //   child: Row(
                    //     //     mainAxisAlignment: MainAxisAlignment.end,
                    //     //     children: [
                    //     //       Text(
                    //     //         '${formatted} hour ago',
                    //     //         style: TextStyle(
                    //     //             fontSize: 13.sp, fontWeight: FontWeight.w400),
                    //     //       ),
                    //     //     ],
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

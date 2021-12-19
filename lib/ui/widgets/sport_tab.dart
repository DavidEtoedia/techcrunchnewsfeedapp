import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/services/api/Model/news_model.dart';
import 'package:food_app/ui/vm/sport_vm.dart';
import 'package:food_app/ui/vm/tech_category.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

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
        return Text(error.toString());
      },
      success: (value) {
        return RefreshIndicator(
          onRefresh: () async {
            return ref.refresh(sportProvider);
          },
          child: ListView.builder(
              itemCount: value!.data.length,
              itemBuilder: (context, index) {
                final tech = value.data[index];
                return SportTabBuild(article: tech);
              }),
        );
      },
    );
  }
}

class SportTabBuild extends HookConsumerWidget {
  final Datum article;
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

      if (article.source == 'Essentially Sports') {
        return 'E Sport';
      }

      if (article.source == "The Independent - Sports") {
        return 'Independent';
      }
      if (article.source == "Sportstar Live") {
        return 'Sportstar';
      }
      if (article.source == "FOX News - Sports") {
        return 'FOX Sport';
      } else {
        return article.source;
      }
    }

    final newText = article.title;
    final maxline = 5;
    //     var dateTimer = DateTime.now();
    DateTime pubDate = article.publishedAt;
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    placeholder: (context, url) => CircularProgressIndicator(),
                    imageUrl: article.image),
              ),
              Gap(20),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 170,
                      margin: EdgeInsets.only(
                        top: 25.h,
                      ),
                      child: newText.length > maxline
                          ? Text(
                              article.title,
                              maxLines: 4,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w400),
                            )
                          : Text(
                              article.title,
                              maxLines: 4,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w400),
                            )),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        sourceDisplay(),
                        width: 15,
                        height: 15,
                      ),
                      Gap(6),
                      Text(
                        sourceName(),
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w400),
                      ),
                      Gap(15),
                      Container(
                        // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${formatted} hour ago',
                              style: TextStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/services/api/Model/news_model.dart';
import 'package:food_app/core/services/api/Model/news_category.dart';
import 'package:food_app/ui/vm/tech_category.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'component/loading.dart';

class TechTab extends ConsumerStatefulWidget {
  const TechTab({Key? key}) : super(key: key);

  @override
  TechTabState createState() => TechTabState();
}

class TechTabState extends ConsumerState<TechTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(techProvider);

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
            return ref.refresh(techProvider);
          },
          child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              itemCount: value!.articles!.length,
              itemBuilder: (context, index) {
                final tech = value.articles![index];
                return TechTabBuild(article: tech);
              }),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

// class TechTab extends HookConsumerWidget {
//   const TechTab({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final vm = ref.watch(techProvider);
//     return vm.when(
//       idle: () {
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//       loading: () {
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//       error: (Object error, StackTrace stackTrace) {
//         return Center(
//             child: Container(
//                 margin: EdgeInsets.only(left: 35, right: 35),
//                 child: Text(error.toString())));
//       },
//       success: (value) {
//         return RefreshIndicator(
//           onRefresh: () async {
//             return ref.refresh(techProvider);
//           },
//           child: ListView.builder(
//               physics: AlwaysScrollableScrollPhysics(
//                   parent: BouncingScrollPhysics()),
//               itemCount: value!.articles!.length,
//               itemBuilder: (context, index) {
//                 final tech = value.articles![index];
//                 return TechTabBuild(article: tech);
//               }),
//         );
//       },
//     );
//   }
// }

class TechTabBuild extends HookConsumerWidget {
  final NewsCategory article;
  const TechTabBuild({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = useState('assets/images/techcrunch.png');
    final theAge = useState('assets/images/theAge.png');
    final vergeImage = useState('assets/images/Verge.png');
    final thnImage = useState('assets/images/THN.jpeg');
    final engadgetImage = useState('assets/images/engadget.png');
    DateTime pubDate = article.publishedAt!;
    String formatted = DateFormat('h').format(pubDate);
    String sourceDisplay() {
      // var timeNow = DateTime.now().hour;

      if (article.source!.name == "TechCrunch") {
        return image.value;
      }
      if (article.source == 'The Verge') {
        return vergeImage.value;
      }
      if (article.source == 'The Age') {
        return theAge.value;
      }
      if (article.source == 'Engadget') {
        return engadgetImage.value;
      }
      if (article.source == 'Hacker News') {
        return thnImage.value;
      } else {
        return vergeImage.value;
      }
    }

    final newText = article.title;
    final maxline = 5;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container();
              });
        },
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
                    placeholder: (context, url) => LoadingProgress(),
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
                              style: TextStyle(
                                  height: 1.2,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                            )
                          : Text(
                              article.title.toString(),
                              maxLines: 4,
                              style: TextStyle(
                                  height: 1.2,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                    ),
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
                                article.source!.name.toString(),
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

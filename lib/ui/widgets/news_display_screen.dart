import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/services/api/Model/news_model.dart';
import 'package:food_app/ui/vm/news_vm.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class NewsList extends HookConsumerWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(allNewsArticleProvider);

    return vm.when(idle: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    }, success: (data) {
      return SizedBox(
        height: 200.h,
        child: RefreshIndicator(
          onRefresh: () async {
            return ref.refresh(allNewsArticleProvider);
          },
          child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              itemCount: data!.articles!.length,
              itemBuilder: (context, index) {
                final news = data.articles![index];
                return NewsListBuild(article: news);
              }),
        ),
      );
    }, error: (Object error, StackTrace stackTrace) {
      return Text(error.toString());
    });
  }
}

class NewsListBuild extends HookConsumerWidget {
  final Article article;
  const NewsListBuild({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = useState('assets/images/techcrunch.png');
    final cnnImage = useState('assets/images/ccn.png');
    final bbcImage = useState('assets/images/bbcNew.png');
    final newText = article.title;
    final maxline = 5;
    DateTime pubDate = article.publishedAt!;
    String formatted = DateFormat('h').format(pubDate);
    String sourceDisplay() {
      // var timeNow = DateTime.now().hour;

      if (article.source!.name == 'fox8.com') {
        return image.value;
      }
      if (article.source!.name == "fox5sandiego.com") {
        return bbcImage.value;
      }
      if (article.source!.name == 'Gizmodo.com') {
        return cnnImage.value;
      } else {
        return bbcImage.value;
      }
    }

    String sourceName() {
      // var timeNow = DateTime.now().hour;

      if (article.source!.name == 'fox8.com') {
        return 'fox8';
      }
      if (article.source!.name == "fox5sandiego.com") {
        return 'fox5sandiego';
      }
      if (article.source!.name == 'Gizmodo.com') {
        return 'Gizmodo';
      }
      if (article.source!.name == 'CNN') {
        return 'CNN';
      }
      if (article.source!.name == 'New York Times') {
        return 'NY Times';
      }
      if (article.source!.name == 'The Wall Street Journal') {
        return 'TWS Journal';
      }
      if (article.source!.name == 'The Washington Post') {
        return 'Washington Post';
      }
      if (article.source!.name == 'Acme Packing Company') {
        return 'AP Company';
      }
      if (article.source!.name == '') {
        return 'AP Company';
      } else {
        return article.source!.name.toString();
      }
    }

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
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              )
                            : Text(
                                article.title.toString(),
                                maxLines: 4,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
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
                          Container(
                            width: 100,
                            child: Text(
                              sourceName(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.w400),
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
              // Padding(
              //   padding: const EdgeInsets.only(right: 200),
              //   child: Text(article.author),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   'Name',
              //   style: TextStyle(fontSize: 19),
              // ),
              // SizedBox(
              //   height: 20,
              // ),

              // Row(
              //   children: [
              //     Image(
              //       image: AssetImage('assets/images/techcrunch.png'),
              //       height: 20,
              //       width: 20,
              //     ),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     Text(
              //       'TECHCRUNCH',
              //       style: TextStyle(fontWeight: FontWeight.w500),
              //     ),
              //     SizedBox(width: 140),
              //     Row(
              //       children: [
              //         Icon(
              //           Icons.favorite_border_outlined,
              //           color: Colors.grey,
              //         ),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Icon(
              //           Icons.ios_share,
              //           color: Colors.grey,
              //         ),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Icon(
              //           Icons.tune_outlined,
              //           color: Colors.grey,
              //         ),
              //       ],
              //     )
              //   ],
              // ),

              // Divider(
              //   color: Colors.grey,
              // ),
              // SizedBox(
              //   height: 20,
              // )
            ],
          ),
        ),
      ),
    );
  }
}

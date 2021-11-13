import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/services/api/Model/news_model.dart';
import 'package:food_app/ui/vm/news_vm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NewsArticle')),
      body: SafeArea(
        child: Column(
          children: [SizedBox(height: 100.h), NewsList()],
        ),
      ),
    );
  }
}

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
      return Expanded(
        child: SizedBox(
          height: 200.h,
          child: ListView.builder(
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

class NewsListBuild extends StatelessWidget {
  final Article article;
  const NewsListBuild({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 19, right: 19),
      child: Column(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: article.urlToImage!),
              // child: Image(
              //   image: NetworkImage(article.urlToImage),
              // ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 200),
          //   child: Text(article.author),
          // ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Name',
            style: TextStyle(fontSize: 19),
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            children: [
              Image(
                image: AssetImage('assets/images/techcrunch.png'),
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'TECHCRUNCH',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 140),
              Row(
                children: [
                  Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.ios_share,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.tune_outlined,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),

          Divider(
            color: Colors.grey,
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/services/api/Model/news_model.dart';
import 'package:food_app/ui/vm/tech_category.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TechTab extends HookConsumerWidget {
  const TechTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        return Text(error.toString());
      },
      success: (value) {
        return RefreshIndicator(
          onRefresh: () async {
            return ref.refresh(techProvider);
          },
          child: ListView.builder(
              itemCount: value!.data.length,
              itemBuilder: (context, index) {
                final tech = value.data[index];
                return TechTabBuild(article: tech);
              }),
        );
      },
    );
  }
}

class TechTabBuild extends HookConsumerWidget {
  final Datum article;
  const TechTabBuild({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = useState('assets/images/techcrunch.png');
    final theAge = useState('assets/images/theAge.png');
    final vergeImage = useState('assets/images/Verge.png');
    final thnImage = useState('assets/images/THN.jpeg');
    final engadgetImage = useState('assets/images/engadget.png');
    String sourceDisplay() {
      // var timeNow = DateTime.now().hour;

      if (article.source == "TechCrunch") {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 170,
                    margin: EdgeInsets.only(
                      top: 25.h,
                    ),
                    child: Text(
                      article.title,
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Gap(10),
                  Row(
                    children: [
                      Image.asset(
                        sourceDisplay(),
                        width: 20,
                        height: 20,
                      ),
                      Gap(6),
                      Text(
                        article.source,
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w400),
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

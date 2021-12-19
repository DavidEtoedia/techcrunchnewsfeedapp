import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/services/api/Model/news_model.dart';
import 'package:food_app/ui/vm/health_vm.dart';
import 'package:food_app/ui/vm/sport_vm.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HealthTab extends HookConsumerWidget {
  const HealthTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(healthProvider);
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
            return ref.refresh(healthProvider);
          },
          child: ListView.builder(
              itemCount: value!.data.length,
              itemBuilder: (context, index) {
                final tech = value.data[index];
                return HealthTabBuild(article: tech);
              }),
        );
      },
    );
  }
}

class HealthTabBuild extends HookConsumerWidget {
  final Datum article;
  const HealthTabBuild({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = useState('assets/images/techcrunch.png');
    final cnnImage = useState('assets/images/ccn.png');
    final bbcImage = useState('assets/images/bbcNew.png');
    String sourceDisplay() {
      // var timeNow = DateTime.now().hour;

      if (article.source == "TechCrunch") {
        return image.value;
      }
      if (article.source == 'CNN' ||
          article.source == 'CNN US' ||
          article.source == 'CNN Europe' ||
          article.source == 'CNN Americas') {
        return cnnImage.value;
      }
      if (article.source == "BBC News - US & Canada" ||
          article.source == "BBC News - UK") {
        return bbcImage.value;
      } else {
        return bbcImage.value;
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
                        width: 15,
                        height: 15,
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

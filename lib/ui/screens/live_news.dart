import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_app/core/controller/generic_state_notifier.dart';
import 'package:food_app/ui/vm/news_feed_vm.dart';
import 'package:food_app/ui/widgets/component/loading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class LiveNews extends HookConsumerWidget {
  const LiveNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(newsFeedProvider);

    // useEffect(() {
    //   Timer.periodic(Duration(minutes: 20), (timer) {
    //     print('refreshing');
    //     return ref.refresh(newsFeedProvider.notifier);
    //   });
    // });

    return vm.when(loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    }, error: (Object error, StackTrace? stackTrace) {
      return Center(
          child: Container(
              margin: EdgeInsets.only(left: 35, right: 35),
              child: Text(error.toString())));
    }, success: (data) {
      return SizedBox(
        height: 200,
        child: ListView.separated(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          scrollDirection: Axis.horizontal,
          itemCount: data!.articles!.length,
          itemBuilder: (context, index) {
            final newsfeed = data.articles![index];
            DateTime pubDate = newsfeed.publishedAt!;
            String formatted = DateFormat('h').format(pubDate);
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  height: 0,
                  width: 250,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bound) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black38, Colors.black87],
                            stops: [
                              0.0,
                              0.7
                            ], // 10% purple, 80% transparent, 10% purple
                          ).createShader(bound);
                        },
                        blendMode: BlendMode.dstOut,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: 140,
                          width: 140,
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/images/noImage.png',
                            width: 20,
                            height: 20,
                          ),
                          placeholder: (context, url) => LoadingProgress(),
                          imageUrl: newsfeed.urlToImage.toString(),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        right: 15,
                        top: 125,
                        child: Text(
                          newsfeed.title.toString(),
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      // Positioned(
                      //   left: 15,
                      //   right: 15,
                      //   bottom: 10,
                      //   child: Text(
                      //     '$formatted hours ago',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 0,
            );
          },
        ),
      );
    }, idle: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

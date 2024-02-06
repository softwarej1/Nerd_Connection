import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/feed_controller.dart';
import 'package:flutter_getx_palette_diary/src/model/feed.dart';
import 'package:flutter_getx_palette_diary/src/view/update_page.dart';
import 'package:get/get.dart';

class MyPage extends GetView<FeedController> {
  @override
  final FeedController controller;

  const MyPage({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PALETTE',
          style: TextStyle(
            fontFamily: 'NanumGothic',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const UpdatePage());
              },
              icon: const Icon(Icons.edit)),
        ],
      ),
      body: _myFeed(),
    );
  }

  Widget _myFeed() {
    return FutureBuilder<List<Feed>?>(
      future: controller.feedFetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('에러: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Text('데이터 없음');
        } else {
          List<Feed> feeds = snapshot.data!;
          print(feeds);
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
            ),
            itemBuilder: (context, index) {
              if (index < feeds.length) {
                Feed feed = feeds[index];
                if (index == feeds.length - 1) {
                  print('111');
                  print(feed.post_no);
                }
                return Container(
                  color: Colors.blueGrey,
                  child: Image.network(
                    feed.photo_url ?? '',
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return Container();
              }
            },
            itemCount: feeds.length,
          );
        }
      },
    );
  }
}

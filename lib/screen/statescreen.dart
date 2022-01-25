import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_news/provider/news.dart';
import 'package:simple_url_preview/simple_url_preview.dart';

class StateScreen extends StatelessWidget {
  final newsTopic = [
    'World',
    'Nation',
    'Business',
    'Technology',
    'Science',
    'Sport',
    'Health'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
        title: Column(
          children: [
            Text(
              "The",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              "Google News",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            return Card(
              child: Container(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newsTopic.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          ref
                              .read(newsProvider.notifier)
                              .updateCategory(newsTopic[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(newsTopic[index]),
                              ],
                            ),
                          ),
                        ));
                  },
                ),
              ),
            );
          }),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 400,
            child: Consumer(
              builder: (context, ref, child) {
                final data = ref.watch(newsProvider);
                return data.news?.length == 0
                    ? Center(
                        child: Container(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ListView.builder(
                        itemCount: data.news?.length,
                        itemBuilder: (context, index) {
                          return SimpleUrlPreview(
                            bgColor: Colors.black,
                            url: data.news![index].link!,
                            titleStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                            descriptionStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            siteNameStyle: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor,
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}

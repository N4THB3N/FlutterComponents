import 'package:fl_components/screens/screens.dart';
import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imagesList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        //add10();
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    Future.delayed(const Duration(seconds: 3));
    add10();

    isLoading = false;
    setState(() {});

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(seconds: 3), curve: Curves.fastOutSlowIn);
  }

  void add10() {
    final lastId = imagesList.last;
    imagesList.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesList.last;
    imagesList.clear();
    imagesList.add(lastId + 1);
    add10();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              itemBuilder: (BuildContext context, int index) {
                return MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: FadeInImage(
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      placeholder: const AssetImage('assets/jar-loading.gif'),
                      image: NetworkImage(
                          'https://picsum.photos/500/300?image=${imagesList[index]}')),
                );
              },
              itemCount: imagesList.length,
            ),
          ),
          if (isLoading)
            Positioned(
                bottom: 40,
                left: size.width * 0.5 - 30,
                child: const _LoadingIcon())
        ],
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
      child: const CircularProgressIndicator(
        color: AppTheme.primary,
      ),
    );
  }
}

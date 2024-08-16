import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'InfiniteScrollScreen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final idMyImage = <int>[1, 2, 3, 4, 5];
  final scrollController = ScrollController();
  bool myBandera = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadingNextPage();
      }
    });
  }

  Future loadingNextPage() async {
    if (myBandera) return;
    setState(() {
      myBandera = true;
    });

    await Future.delayed(const Duration(seconds: 3));
    addFiveImage();
    myBandera = false;
    if (!isMounted) return;
    setState(() {});
    moveScrollBottom();
  }

  moveScrollBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
    isMounted = false;
  }

  void addFiveImage() {
    final lastId = idMyImage.last;
    idMyImage.addAll([1, 2, 3, 4, 5].map(
      (e) => lastId + e,
    ));
  }

  Future<void> onRefresh() async {
    myBandera = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    final lastId = idMyImage.last;
    idMyImage.clear();
    idMyImage.add(lastId + 1);
    addFiveImage();
    setState(() {
      myBandera = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: RefreshIndicator(
          edgeOffset: 15,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
              controller: scrollController,
              itemCount: idMyImage.length,
              itemBuilder: (context, index) {
                return FadeInImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    placeholder:
                        const AssetImage('assets/Images/jar-loading.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/id/${idMyImage[index]}/500/300'));
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: myBandera
            ? SpinPerfect(infinite: true, child: const Icon(Icons.refresh))
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}

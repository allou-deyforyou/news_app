import 'package:flutter/material.dart';

import 'screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    this.currentIndex = 0,
  }) : super(key: key);

  final int currentIndex;

  static const path = '/';
  static const name = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<ScrollController> _scrollControllers;
  late final ValueNotifier<int> _indexController;
  late final PageController _pageController;
  late final List<Widget> _children;

  void _animateToPage(ScrollController controller) {
    if (controller.hasClients) {
      const curve = Curves.easeInOut;
      const duration = Duration(seconds: 1);
      controller.animateTo(0.0, curve: curve, duration: duration);
    }
  }

  void _onPageChanged(int value) {
    if (_indexController.value != value) {
      _pageController.jumpToPage(value);
      _indexController.value = value;
    } else {
      _animateToPage(_scrollControllers[value]);
    }
  }

  @override
  void initState() {
    super.initState();
    _indexController = ValueNotifier(widget.currentIndex);
    _pageController = PageController(initialPage: _indexController.value);

    _scrollControllers = [
      PageController(),
      PageController(),
      ScrollController(),
      ScrollController(),
    ];
    _children = const [
      CustomKeepAlive(
        key: ValueKey(HomeArticleScreen.name),
        child: HomeArticleScreen(),
      ),
      CustomKeepAlive(
        key: ValueKey(HomeMediaScreen.name),
        child: HomeMediaScreen(),
      ),
      CustomKeepAlive(
        key: ValueKey(HomeLibraryScreen.name),
        child: HomeLibraryScreen(),
      ),
      CustomKeepAlive(
        key: ValueKey(HomeSettingScreen.name),
        child: HomeSettingScreen(),
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _indexController.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePrimaryIndexController(
        notifier: _indexController,
        child: PageView.builder(
          controller: _pageController,
          itemCount: _children.length,
          onPageChanged: _onPageChanged,
          itemBuilder: (context, index) {
            return PrimaryScrollController(
              controller: _scrollControllers[index],
              child: _children[index],
            );
          },
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _indexController,
        builder: (context, index, child) {
          return HomeBottomNavigationBar(
            onTap: _onPageChanged,
            currentIndex: index,
          );
        },
      ),
    );
  }
}

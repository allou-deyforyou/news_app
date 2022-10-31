import 'package:flutter/cupertino.dart';

import 'widget.dart';

class _HomeBottomNavigationBarItem extends StatelessWidget {
  const _HomeBottomNavigationBarItem({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: child,
      ),
    );
  }
}

class HomeBottomNavigationBar extends DefaultAppBar {
  const HomeBottomNavigationBar({
    Key? key,
    this.onTap,
    this.currentIndex = 0,
  }) : super(key: key);

  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return SizedBox(
      height: preferredSize.height,
      child: CupertinoTabBar(
        onTap: onTap,
        iconSize: 24.0,
        currentIndex: currentIndex,
        border: Border(top: BorderSide(color: theme.dividerColor)),
        items: const [
          BottomNavigationBarItem(
            activeIcon: _HomeBottomNavigationBarItem(
              child: Icon(CupertinoIcons.news_solid),
            ),
            icon: _HomeBottomNavigationBarItem(
              child: Icon(CupertinoIcons.news),
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
            activeIcon: _HomeBottomNavigationBarItem(
              child: Icon(CupertinoIcons.tv_fill),
            ),
            icon: _HomeBottomNavigationBarItem(
              child: Icon(CupertinoIcons.tv),
            ),
            label: 'MyTv',
          ),
          BottomNavigationBarItem(
            activeIcon: _HomeBottomNavigationBarItem(
              child: Icon(CupertinoIcons.square_stack_3d_up_fill),
            ),
            icon: _HomeBottomNavigationBarItem(
              child: Icon(CupertinoIcons.square_stack_3d_up),
            ),
            label: 'Bibliothèque',
          ),
          BottomNavigationBarItem(
            activeIcon: _HomeBottomNavigationBarItem(
              child: Icon(CupertinoIcons.gear_solid),
            ),
            icon: _HomeBottomNavigationBarItem(
              child: Icon(CupertinoIcons.gear),
            ),
            label: 'Paramètres',
          ),
        ],
      ),
    );
  }
}

class HomePrimaryIndexController extends InheritedNotifier<ValueNotifier<int>> {
  const HomePrimaryIndexController({
    super.key,
    required super.child,
    required ValueNotifier<int> notifier,
  }) : super(notifier: notifier);

  static HomePrimaryIndexController? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomePrimaryIndexController>();
  }

  @override
  bool updateShouldNotify(oldWidget) => oldWidget.notifier != notifier;
}

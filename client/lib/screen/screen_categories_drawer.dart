import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screen.dart';

class HomeCategoriesDrawer extends StatefulWidget {
  const HomeCategoriesDrawer({
    Key? key,
    required this.currentIndex,
    required this.categories,
    required this.listener,
    required this.gender,
    required this.onTap,
  }) : super(key: key);

  final String gender;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<NewsCategory> categories;
  final ValueWidgetListener<NewsState> listener;

  @override
  State<HomeCategoriesDrawer> createState() => _HomeCategoriesDrawerState();
}

class _HomeCategoriesDrawerState extends State<HomeCategoriesDrawer> {
  late final List<NewsCategory> _categories;
  late final NewsService _newsService;

  void _fetchNewsCategories() {
    _newsService.handle(FetchNewsCategories(gender: widget.gender));
  }

  void _listenNewsService(BuildContext context, NewsState state) {
    if (state is CategoryListNewsState) {
      widget.listener(context, state);
      _categories.addAll(state.data);
    }
  }

  @override
  void initState() {
    super.initState();
    _newsService = NewsService(CategoryListNewsState(data: widget.categories));
    _categories = List.empty(growable: true);
    final state = _newsService.value;
    if (state is CategoryListNewsState) {
      _categories.addAll(state.data);
    }
    if (_categories.length == 1) {
      _fetchNewsCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final scrollController = ScrollController();
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(color: theme.canvasColor),
            child: const SizedBox.shrink(),
          ),
          Expanded(
            child: ValueListenableConsumer<NewsState>(
              listener: _listenNewsService,
              valueListenable: _newsService,
              builder: (context, state, child) {
                if (state is PendingNewsState) {
                  return const SizedBox.shrink();
                } else if (state is CategoryListNewsState) {
                  return CupertinoScrollbar(
                    thumbVisibility: true,
                    controller: scrollController,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      controller: scrollController,
                      itemCount: _categories.length,
                      separatorBuilder: (context, index) {
                        return const Divider(indent: 16.0);
                      },
                      itemBuilder: (context, index) {
                        final item = _categories[index];
                        bool selected = index == widget.currentIndex;
                        return ListTile(
                          selected: selected,
                          minVerticalPadding: 0.0,
                          horizontalTitleGap: 0.0,
                          style: ListTileStyle.drawer,
                          title: Text(item.value.capitalize()),
                          visualDensity: VisualDensity.compact,
                          selectedTileColor: theme.colorScheme.secondary,
                          onTap: () {
                            Navigator.pop(context);
                            widget.onTap(index);
                          },
                        );
                      },
                    ),
                  );
                }
                return Center(
                  child: ErrorMessageWidget(
                    message: "Problème de chargement",
                    onPressed: _fetchNewsCategories,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

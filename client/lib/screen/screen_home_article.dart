import 'package:flutter/material.dart';

import 'screen.dart';

class HomeArticleScreen extends StatefulWidget {
  const HomeArticleScreen({
    Key? key,
    this.currentIndex = 0,
  }) : super(key: key);

  final int currentIndex;

  static const name = 'home_article';

  @override
  State<HomeArticleScreen> createState() => _HomeArticleScreenState();
}

class _HomeArticleScreenState extends State<HomeArticleScreen> {
  late final PageStorageBucket _pageStorageBucket;
  late List<NewsCategory> _categories;
  late final NewsService _service;
  late List<Widget> _children;

  static final _articleKey = NewsType.article.name;

  void _listenNewsService(BuildContext context, NewsState state) {
    if (state is CategoryListNewsState) {
      final data = state.data;
      _categories.addAll(data);
      _children.addAll(data.map(_sectionWidget));
      _service.handle(SetNewsCategories(gender: _articleKey, categories: data));
    }
  }

  Future<void> _getNewsCategoryList() {
    return _service.handle(GetNewsCategories(gender: _articleKey));
  }

  @override
  void initState() {
    super.initState();
    _categories = [NewsCategory(value: 'à la une', name: 'featured')];
    _children = [_sectionWidget(_categories.first)];
    _pageStorageBucket = PageStorageBucket();
    _service = NewsService();
    _getNewsCategoryList();
  }

  Widget _sectionWidget(NewsCategory category) {
    final service = NewsService();
    return CustomKeepAlive(
      key: PageStorageKey(category.name),
      child: HomeArticleSection(
        newsService: service,
        category: category,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: _pageStorageBucket,
      child: ValueListenableConsumer<NewsState>(
        initial: true,
        valueListenable: _service,
        listener: _listenNewsService,
        builder: (context, value, child) {
          return StreamBuilder<int>(
            stream: SettingsService.streamArticleCategoryIndex,
            initialData: SettingsService.getArticleCategoryIndex,
            builder: (context, snapshot) {
              final currentIndex = snapshot.data!;
              final category = _categories[currentIndex].value;
              return Scaffold(
                body: _children[currentIndex],
                drawer: HomeCategoriesDrawer(
                  onTap: SettingsService.setArticleCategoryIndex,
                  listener: _listenNewsService,
                  currentIndex: currentIndex,
                  categories: _categories,
                  gender: _articleKey,
                ),
                appBar: HomeArticleAppBar(
                  title: Text(category.capitalize()),
                  openSearch: () {},
                ),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'screen.dart';

class HomeMediaScreen extends StatefulWidget {
  const HomeMediaScreen({
    Key? key,
    this.currentIndex = 0,
  }) : super(key: key);

  final int currentIndex;

  static const name = 'home_media';

  @override
  State<HomeMediaScreen> createState() => _HomeMediaScreenState();
}

class _HomeMediaScreenState extends State<HomeMediaScreen> {
  late final PageStorageBucket _pageStorageBucket;
  late List<NewsCategory> _categories;
  late final NewsService _service;
  late List<Widget> _children;

  static final _mediaKey = NewsType.media.name;

  void _listenNewsService(BuildContext context, NewsState state) {
    if (state is CategoryListNewsState) {
      final data = state.data;
      _categories.addAll(data);
      _children.addAll(data.map(_sectionWidget));
      _service.handle(SetNewsCategories(gender: _mediaKey, categories: data));
    }
  }

  Future<void> _getNewsCategoryList() {
    return _service.handle(GetNewsCategories(gender: _mediaKey));
  }

  @override
  void initState() {
    super.initState();
    _categories = [NewsCategory(value: 'direct', name: 'live')];
    _children = [_sectionWidget(_categories.first)];
    _pageStorageBucket = PageStorageBucket();
    _service = NewsService();
    _getNewsCategoryList();
  }

  Widget _sectionWidget(NewsCategory category) {
    final indexController = ValueNotifier(0);
    final service = NewsService();

    return CustomKeepAlive(
      key: PageStorageKey(category.name),
      child: HomeMediaSection(
        indexController: indexController,
        newsService: service,
        category: category,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return HomeMediaPrimaryIndexController(
      notifier: SettingsService.streamMediaCategoryIndex.asBroadcastStream(),
      child: PageStorage(
        bucket: _pageStorageBucket,
        child: ValueListenableConsumer<NewsState>(
          initial: true,
          valueListenable: _service,
          listener: _listenNewsService,
          builder: (context, value, child) {
            return StreamBuilder<int>(
              initialData: SettingsService.getMediaCategoryIndex,
              stream: SettingsService.streamMediaCategoryIndex,
              builder: (context, snapshot) {
                final index = snapshot.data!;
                final category = _categories[index].value;
                return Scaffold(
                  body: _children[index],
                  appBar: HomeMediaAppBar(
                    title: Text(category.capitalize()),
                    openSearch: () {},
                  ),
                  drawer: HomeCategoriesDrawer(
                    onTap: SettingsService.setMediaCategoryIndex,
                    listener: _listenNewsService,
                    categories: _categories,
                    currentIndex: index,
                    gender: _mediaKey,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

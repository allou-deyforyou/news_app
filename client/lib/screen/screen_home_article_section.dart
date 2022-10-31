import 'package:flutter/material.dart';

import 'screen.dart';

class HomeArticleSection extends StatefulWidget {
  const HomeArticleSection({
    Key? key,
    required this.category,
    required this.newsService,
  }) : super(key: key);

  final NewsCategory category;
  final NewsService newsService;

  @override
  State<HomeArticleSection> createState() => HomeArticleSectionState();
}

class HomeArticleSectionState extends State<HomeArticleSection> {
  late List<ArticlePost> _articlePosts;
  late PageController _pageController;
  late bool _fetching;
  late int _page;

  void _onItemTaped(ArticlePost item) {
    context.goNamed(ArticleContentScreen.name, extra: item);
  }

  Future<void> _fetchArticlePostList([int page = 1]) async {
    if (_fetching || page == 1) {
      _fetching = false;
      return widget.newsService.handle(FetchArticlePostList(
        category: widget.category.name,
        page: page,
      ));
    }
  }

  Future<void> _loadArticlePostList() async {
    widget.newsService.value = const PendingNewsState();
    await _fetchArticlePostList();
  }

  void _onPageChanged(int page) {
    // if ((_articlePosts.length ~/ 2) == (page + 1)) {
    //   _fetchArticlePostList(_page);
    // }
  }

  void _listenNewsState(BuildContext context, NewsState state) {
    if (state is ArticlePostListNewsState && state.data.isNotEmpty) {
      var page = state.page;
      var data = state.data;
      if (page != 1) {
        _articlePosts.addAll(data);
      } else {
        _articlePosts = data;
      }
      _fetching = true;
      _page = page++;
    } else if (state is FailureNewsState) {
      _fetching = true;
    }
  }

  @override
  void initState() {
    super.initState();
    _fetching = true;
    final state = widget.newsService.value;
    _articlePosts = List.empty(growable: true);
    if (state is ArticlePostListNewsState) {
      _listenNewsState(context, state);
    } else {
      _loadArticlePostList();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pageController = PrimaryScrollController.of(context) as PageController;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _fetchArticlePostList,
      child: ValueListenableConsumer<NewsState>(
        listener: _listenNewsState,
        valueListenable: widget.newsService,
        builder: (context, state, child) {
          if (state is PendingNewsState) {
            return const Center(
              child: CircleProgressIndicatorSharedWidget(),
            );
          } else if (state is ArticlePostListNewsState) {
            return PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final item = _articlePosts[index];
                return CustomKeepAlive(
                  key: ValueKey(item),
                  child: HomeArticlePostWidget(
                    date: item.date.toDateTime(toLocal: true),
                    onTap: () => _onItemTaped(item),
                    description: item.description,
                    source: item.source,
                    title: item.title,
                    image: item.image,
                    titleMaxLines: 3,
                    logo: item.logo,
                    id: item.link,
                  ),
                );
              },
              itemCount: _articlePosts.length,
            );
          }
          return Center(
            child: ErrorMessageWidget(
              message: "Problème de chargement",
              onPressed: _loadArticlePostList,
            ),
          );
        },
      ),
    );
  }
}

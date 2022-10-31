import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screen.dart';

class ArticleContentScreen extends StatefulWidget {
  const ArticleContentScreen({
    Key? key,
    required this.post,
  }) : super(key: key);

  static const path = 'news_article';
  static const name = 'news_article';

  final ArticlePost post;

  @override
  State<ArticleContentScreen> createState() => _ArticleContentScreenState();
}

class _ArticleContentScreenState extends State<ArticleContentScreen> {
  late final ValueNotifier<double> _indicatorController;
  late final ScrollController _scrollController;
  late final NewsService _localNewsService;
  late final NewsService _newsService;

  void _share() {}

  void _report() {}

  void _lookAt() {}

  void _getArticlePost() {
    _localNewsService.handle(
      GetArticlePost(data: widget.post),
    );
  }

  void _seeLater() {
    _localNewsService.handle(
      SetArticlePost(data: widget.post),
    );
  }

  void _textSize() {}

  void _animateToPage() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0.0,
        curve: Curves.easeInOut,
        duration: const Duration(seconds: 1),
      );
    }
  }

  void _fetchNewsArticle() {
    if (widget.post.hasContent()) {
      _newsService.value = ArticlePostNewsState(
        data: widget.post,
      );
    } else {
      _newsService.handle(
        FetchArticleContent(
          source: widget.post.source,
          link: widget.post.link,
        ),
      );
    }
  }

  void _listenNewsService(BuildContext context, NewsState state) {
    if (state is ArticlePostNewsState) {
      widget.post.mergeFromBuffer(
        state.data.writeToBuffer(),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _localNewsService = NewsService(const InitNewsState());
    _newsService = NewsService(const InitNewsState());
    _indicatorController = ValueNotifier(0.0);
    _scrollController = ScrollController();
    _fetchNewsArticle();
    _getArticlePost();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final metrics = _scrollController.position;
      final value = metrics.pixels / metrics.maxScrollExtent;
      _indicatorController.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      floatingActionButton: ValueListenableBuilder<double>(
        valueListenable: _indicatorController,
        builder: (context, value, child) {
          return Visibility(
            visible: value > 0.0,
            child: FloatingActionButton.small(
              onPressed: _animateToPage,
              child: const Icon(CupertinoIcons.chevron_compact_up),
            ),
          );
        },
      ),
      appBar: ArticleContentAppBar(
        onPop: () => context.pop(),
        title: widget.post.title,
        image: widget.post.image,
        actions: [
          ValueListenableBuilder(
            valueListenable: _newsService,
            builder: (context, state, child) {
              VoidCallback? onPressed;
              if (state is ArticlePostNewsState) {
                onPressed = () {};
              }
              return CupertinoButton(
                onPressed: onPressed,
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.textformat_size),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: _newsService,
            builder: (context, state, child) {
              var enable = false;
              if (state is ArticlePostNewsState) {
                enable = true;
              }
              return ValueListenableBuilder(
                valueListenable: _localNewsService,
                builder: (context, state, child) {
                  return PopupMenuButton<String>(
                    enabled: enable,
                    splashRadius: 15.0,
                    padding: EdgeInsets.zero,
                    position: PopupMenuPosition.under,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    itemBuilder: (context) {
                      final list = <PopupMenuEntry<String>>[
                        PopupMenuItem(
                          onTap: _share,
                          child: const Text('Partager'),
                        ),
                        const PopupMenuDivider(height: 1.0),
                        PopupMenuItem(
                          onTap: _report,
                          child: const Text('Signaler'),
                        ),
                        const PopupMenuDivider(height: 1.0),
                        PopupMenuItem(
                          onTap: _lookAt,
                          child: const Text('Voir sur le site'),
                        ),
                      ];
                      if (state is! ArticlePostNewsState) {
                        list.addAll([
                          const PopupMenuDivider(height: 1.0),
                          PopupMenuItem(
                            onTap: _seeLater,
                            child: const Text('À lire plutard'),
                          ),
                        ]);
                      }
                      return list;
                    },
                    icon: const Icon(CupertinoIcons.ellipsis_circle),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: ScrollListener(
        listener: (context, value) {
          _indicatorController.value = value;
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ValueListenableBuilder<double>(
              valueListenable: _indicatorController,
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    theme.colorScheme.secondary,
                  ),
                  minHeight: 3.0,
                  value: value,
                );
              },
            ),
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverFillViewport(
                    padEnds: false,
                    viewportFraction: 0.7,
                    delegate: SliverChildListDelegate([
                      HomeArticlePostWidget(
                        maxFontSize: theme.textTheme.headline5!.fontSize!,
                        date: widget.post.date.toDateTime(toLocal: true),
                        description: widget.post.description,
                        overflow: TextOverflow.visible,
                        source: widget.post.source,
                        title: widget.post.title,
                        image: widget.post.image,
                        logo: widget.post.logo,
                        id: widget.post.link,
                        titleMaxLines: 3,
                      ),
                    ]),
                  ),
                  const SliverToBoxAdapter(child: Divider()),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                      bottom: 60.0,
                      right: 8.0,
                      left: 8.0,
                    ),
                    sliver: SliverFillRemaining(
                      hasScrollBody: false,
                      child: ValueListenableConsumer(
                        listener: _listenNewsService,
                        valueListenable: _newsService,
                        builder: (context, state, child) {
                          if (state is PendingNewsState) {
                            return const Center(
                              child: CircleProgressIndicatorSharedWidget(),
                            );
                          } else if (state is ArticlePostNewsState) {
                            final content = state.data.content;
                            return ArticleContentHtml(data: content);
                          } else if (state is FailureNewsState) {
                            return Center(
                              child: ErrorMessageWidget(
                                message: 'Probleme de chargement',
                                onPressed: _fetchNewsArticle,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

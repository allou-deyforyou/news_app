import 'dart:math';

import 'package:flutter/material.dart';
import 'screen.dart';

class HomeLibraryScreen extends StatefulWidget {
  const HomeLibraryScreen({Key? key}) : super(key: key);

  static const name = 'home_libray';

  @override
  State<HomeLibraryScreen> createState() => _HomeLibraryScreenState();
}

class _HomeLibraryScreenState extends State<HomeLibraryScreen> {
  late final TextEditingController _searchController;

  late final NewsService _service;

  void _onItemTaped(ArticlePost item) {
    context.goNamed(ArticleContentScreen.name, extra: item);
  }

  void _streamArticlePostList() {
    _service.handle(const StreamArticlePostList());
  }

  @override
  void initState() {
    super.initState();
    _service = NewsService();
    _streamArticlePostList();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeLibraryAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeLibrarySearchTextField(
              controller: _searchController,
            ),
          ),
          ValueListenableBuilder<NewsState>(
            valueListenable: _service,
            builder: (context, state, child) {
              if (state is PendingNewsState) {
                return const Center(
                  child: CircleProgressIndicatorSharedWidget(),
                );
              } else if (state is ArticlePostListNewsState) {
                final items = state.data;
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index.isEven) {
                        index ~/= 2;
                        final item = items[index];
                        return HomeLibraryItemWidget(
                          confirmDismiss: (direction) async {
                            final confirm = await showDialog<bool>(
                              context: context,
                              builder: (context) {
                                return HomeLibraryModal(
                                  title: item.title,
                                  image: item.image,
                                );
                              },
                            );
                            if (confirm != null && confirm) {
                              await DeleteArticlePostList.execute(item);
                              return true;
                            }
                            return false;
                          },
                          date: item.date.toDateTime(toLocal: true),
                          onTap: () => _onItemTaped(item),
                          source: item.source,
                          image: item.image,
                          title: item.title,
                          link: item.link,
                        );
                      }
                      return const SizedBox(height: 8.0);
                    },
                    childCount: max(0, items.length * 2 - 1),
                  ),
                );
              }
              return Center(
                child: ErrorMessageWidget(
                  message: 'Probleme de chargement',
                  onPressed: _streamArticlePostList,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

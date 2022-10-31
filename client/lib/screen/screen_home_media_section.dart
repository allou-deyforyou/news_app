import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

import 'screen.dart';

class HomeMediaSection extends StatefulWidget {
  const HomeMediaSection({
    Key? key,
    required this.indexController,
    required this.newsService,
    required this.category,
  }) : super(key: key);

  final ValueNotifier<int> indexController;
  final NewsService newsService;
  final NewsCategory category;

  @override
  State<HomeMediaSection> createState() => HomeMediaSectionState();
}

class HomeMediaSectionState extends State<HomeMediaSection> {
  late List<ValueNotifier<PodPlayerController>> _mediaPostControllers;
  late List<NewsService> _mediaPostServices;
  late List<MediaPost> _mediaPosts;
  late bool _fetching;
  late int _page;

  Future<void> _loadMediaPostList() {
    widget.newsService.value = const PendingNewsState();
    return _fetchMediaPostList();
  }

  Future<void> _fetchMediaPostList([int page = 1]) async {
    if (_fetching || page == 1) {
      _fetching = false;
      return widget.newsService.handle(FetchMediaPostList(
        category: widget.category.name,
        page: page,
      ));
    }
  }

  void _onPageChanged(int index) async {
    widget.indexController.value = index;
  }

  void _listenNewsState(BuildContext context, NewsState state) {
    if (state is MediaPostListNewsState && state.data.isNotEmpty) {
      var page = state.page;
      var data = state.data;
      final services = state.services;
      var controllers = state.controllers;
      if (page != 1) {
        _mediaPostControllers.addAll(controllers);
        _mediaPostServices.addAll(services);
        _mediaPosts.addAll(data);
      } else {
        _mediaPostControllers = controllers;
        _mediaPostServices = services;
        _mediaPosts = data;
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
    _mediaPosts = List.empty(growable: true);
    _mediaPostServices = List.empty(growable: true);
    _mediaPostControllers = List.empty(growable: true);
    final state = widget.newsService.value;
    if (state is MediaPostListNewsState) {
      _listenNewsState(context, state);
    } else {
      _loadMediaPostList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = PrimaryScrollController.of(context) as PageController;
    return RefreshIndicator(
      onRefresh: _fetchMediaPostList,
      child: ValueListenableConsumer<NewsState>(
        listener: _listenNewsState,
        valueListenable: widget.newsService,
        builder: (context, state, child) {
          if (state is PendingNewsState) {
            return const Center(
              child: CircleProgressIndicatorSharedWidget(),
            );
          } else if (state is MediaPostListNewsState) {
            return PageView.builder(
              controller: controller,
              onPageChanged: _onPageChanged,
              itemCount: _mediaPosts.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final controller = _mediaPostControllers[index];
                final service = _mediaPostServices[index];
                final item = _mediaPosts[index];
                return CustomKeepAlive(
                  key: ValueKey(item),
                  child: MediaContentScreen(
                    indexController: widget.indexController,
                    controller: controller,
                    service: service,
                    index: index,
                    post: item,
                  ),
                );
              },
            );
          }
          return Center(
            child: ErrorMessageWidget(
              message: "Problème de chargement",
              onPressed: _loadMediaPostList,
            ),
          );
        },
      ),
    );
  }
}

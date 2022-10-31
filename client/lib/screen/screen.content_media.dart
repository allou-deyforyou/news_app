import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

import 'screen.dart';

class MediaContentScreen extends StatefulWidget {
  const MediaContentScreen({
    Key? key,
    required this.indexController,
    required this.controller,
    required this.service,
    required this.index,
    required this.post,
  }) : super(key: key);

  final ValueNotifier<PodPlayerController> controller;
  final ValueNotifier<int> indexController;
  final NewsService service;
  final MediaPost post;
  final int index;

  @override
  State<MediaContentScreen> createState() => _MediaContentScreenState();
}

class _MediaContentScreenState extends State<MediaContentScreen> {
  void _fetchMediaContent() {
    if (widget.post.hasContent()) {
      widget.service.value = MediaPostNewsState(data: widget.post);
    } else {
      widget.service.handle(
        FetchMediaContent(
          source: widget.post.source,
          link: widget.post.link,
        ),
      );
    }
  }

  void _listenNewsService(BuildContext context, NewsState state) {
    if (state is MediaPostNewsState) {
      widget.post.mergeFromBuffer(state.data.writeToBuffer());
      widget.controller.value = PodPlayerController(
        playVideoFrom: NewsEvent.getController(widget.post),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchMediaContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableConsumer<NewsState>(
        listener: _listenNewsService,
        valueListenable: widget.service,
        builder: (context, state, child) {
          if (state is PendingNewsState) {
            return const Center(
              child: CircleProgressIndicatorSharedWidget(),
            );
          } else if (state is MediaPostNewsState) {
            DateTime? date;
            if (widget.post.hasDate()) {
              date = widget.post.date.toDateTime(toLocal: true);
            }
            String? title;
            if (widget.post.hasTitle()) {
              title = widget.post.title;
            }
            return HomeMediaPostTile(
              indexController: widget.indexController,
              description: widget.post.description,
              controller: widget.controller.value,
              source: widget.post.source,
              logo: widget.post.logo,
              live: widget.post.live,
              index: widget.index,
              title: title,
              date: date,
            );
          }
          return Center(
            child: ErrorMessageWidget(
              message: 'Probleme de chargement',
              onPressed: _fetchMediaContent,
            ),
          );
        },
      ),
    );
  }
}

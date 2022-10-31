import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

import 'widget.dart';

class HomeMediaAppBar extends DefaultAppBar {
  const HomeMediaAppBar({
    Key? key,
    required this.title,
    this.openSearch,
  }) : super(key: key);

  final Widget title;
  final VoidCallback? openSearch;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        onPressed: () => Scaffold.of(context).openDrawer(),
        child: const Icon(CupertinoIcons.bars),
      ),
      title: title,
    );
  }
}

class HomeMediaControllers extends StatefulWidget {
  const HomeMediaControllers({
    Key? key,
    this.iconColor = CupertinoColors.systemGrey5,
    required this.indexController,
    required this.controller,
    this.iconSize = 55.0,
    required this.index,
  }) : super(key: key);

  final ValueNotifier<int> indexController;
  final PodPlayerController controller;
  final Color iconColor;
  final double iconSize;
  final int index;

  @override
  State<HomeMediaControllers> createState() => _HomeMediaControllersState();
}

class _HomeMediaControllersState extends State<HomeMediaControllers> {
  StreamSubscription<int>? _homeMediaIndexController;
  ValueNotifier<int>? _homeIndexController;
  late bool _canPlay;

  void _listenPlayer() {
    if (mounted) {
      setState(() {});
    }
  }

  void _listenHomeMediaIndex(int index) {
    if (widget.index == widget.indexController.value &&
        widget.controller.isVideoPlaying) {
      _pause();
    }
  }

  void _listenHomeIndex() {
    if (_homeIndexController?.value != 1) {
      _canPlay = false;
      _pause();
    } else {
      _canPlay = true;
      _listenIndex();
    }
  }

  void _listenIndex() {
    if (widget.index != widget.indexController.value) {
      _pause();
    } else {
      if (_canPlay) _play();
    }
  }

  void _initialize() async {
    _canPlay = true;
    if (!widget.controller.isInitialised) {
      await widget.controller.initialise();
    }
    _listenHomeIndex();
  }

  void _play() async {
    widget.controller.play();
  }

  void _pause() {
    widget.controller.pause();
  }

  @override
  void initState() {
    super.initState();
    widget.indexController.addListener(_listenIndex);
    widget.controller.addListener(_listenPlayer);
    _initialize();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final value = HomeMediaPrimaryIndexController.of(context)!;
    _homeMediaIndexController = value.notifier.listen(_listenHomeMediaIndex);
    _homeIndexController = HomePrimaryIndexController.of(context)!.notifier!;
    _homeIndexController?.removeListener(_listenHomeIndex);
    _homeIndexController?.addListener(_listenHomeIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _homeIndexController?.removeListener(_listenHomeIndex);
    widget.indexController.removeListener(_listenIndex);
    widget.controller.removeListener(_listenPlayer);
    _homeMediaIndexController?.cancel();
    _pause();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.controller.isInitialised,
      replacement: const Center(child: CustomCircleProgessIndicator()),
      child: Visibility(
        visible: widget.controller.videoState == PodVideoState.paused,
        replacement: GestureDetector(onTap: _pause),
        child: CupertinoButton(
          onPressed: _initialize,
          child: Icon(
            CupertinoIcons.play_fill,
            color: widget.iconColor,
            size: widget.iconSize,
          ),
        ),
      ),
    );
  }
}

class HomeMediaPostTile extends StatelessWidget {
  const HomeMediaPostTile({
    Key? key,
    required this.indexController,
    required this.description,
    required this.controller,
    required this.source,
    required this.index,
    required this.logo,
    required this.live,
    this.title,
    this.date,
  }) : super(key: key);

  final ValueNotifier<int> indexController;
  final PodPlayerController controller;
  final String description;
  final String source;
  final String logo;
  final int index;
  final bool live;

  final DateTime? date;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        HomeMediaPlayer(
          alwaysShowProgressBar: !live,
          controller: controller,
        ),
        PostItemSharedWidget(
          maxFontSize: double.infinity,
          description: description,
          source: source,
          title: title,
          date: date,
          logo: logo,
        ),
        HomeMediaControllers(
          indexController: indexController,
          controller: controller,
          index: index,
        ),
      ],
    );
  }
}

class HomeMediaPlayer extends StatefulWidget {
  const HomeMediaPlayer({
    Key? key,
    required this.controller,
    this.alwaysShowProgressBar = false,
  }) : super(key: key);

  final bool alwaysShowProgressBar;
  final PodPlayerController controller;

  @override
  State<HomeMediaPlayer> createState() => _HomeMediaPlayerState();
}

class _HomeMediaPlayerState extends State<HomeMediaPlayer> {
  void _listenPlayer() {
    if (widget.controller.isInitialised) {
      widget.controller.removeListener(_listenPlayer);
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_listenPlayer);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listenPlayer);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.7,
        child: Stack(
          children: [
            Positioned.fill(
              child: PodVideoPlayer(
                overlayBuilder: (options) => const SizedBox.shrink(),
                alwaysShowProgressBar: false,
                controller: widget.controller,
                key: UniqueKey(),
              ),
            ),
            Visibility(
              visible: widget.alwaysShowProgressBar,
              child: Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: PodProgressBar(
                  podProgressBarConfig: const PodProgressBarConfig(
                    alwaysVisibleCircleHandler: true,
                  ),
                  tag: widget.controller.getTag,
                  key: UniqueKey(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeMediaPrimaryIndexController extends InheritedWidget {
  const HomeMediaPrimaryIndexController({
    super.key,
    required super.child,
    required this.notifier,
  });

  final Stream<int> notifier;

  static HomeMediaPrimaryIndexController? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<HomeMediaPrimaryIndexController>();
  }

  @override
  bool updateShouldNotify(HomeMediaPrimaryIndexController oldWidget) =>
      oldWidget.notifier != notifier;
}

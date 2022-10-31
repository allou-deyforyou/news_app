import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget.dart';

class HomeArticleAppBar extends DefaultAppBar {
  const HomeArticleAppBar({
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
      actions: [
        CupertinoButton(
          onPressed: openSearch,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: const Icon(CupertinoIcons.search),
        ),
      ],
    );
  }
}

class _HomeArticleImageWidget extends StatelessWidget {
  const _HomeArticleImageWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      padding: const EdgeInsets.only(bottom: 2.0),
      foregroundDecoration: BoxDecoration(
        color: Colors.black,
        gradient: LinearGradient(
          tileMode: TileMode.decal,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ...List.generate(10, (index) {
              return theme.scaffoldBackgroundColor
                  .withOpacity((index + 1) * 0.005);
            }),
            ...List.generate(20, (index) {
              return theme.scaffoldBackgroundColor
                  .withOpacity((index + 1) * 0.05);
            }),
          ],
        ),
      ),
      child: CachedNetworkImageSharedWidget(image: image),
    );
  }
}

class HomeArticlePostWidget extends StatelessWidget {
  const HomeArticlePostWidget({
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.maxFontSize = double.infinity,
    required this.titleMaxLines,
    required this.description,
    required this.source,
    required this.image,
    required this.title,
    required this.date,
    required this.logo,
    required this.id,
    this.onTap,
  }) : super(key: key);

  final TextOverflow overflow;
  final double maxFontSize;
  final String description;
  final int titleMaxLines;
  final DateTime date;
  final String source;
  final String image;
  final String title;
  final String logo;
  final String id;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Hero(
      tag: id,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          margin: EdgeInsets.zero,
          shape: const Border.fromBorderSide(BorderSide.none),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: _HomeArticleImageWidget(image: image),
              ),
              Container(
                color: theme.scaffoldBackgroundColor,
                child: PostItemSharedWidget(
                  titleMaxLines: titleMaxLines,
                  maxFontSize: maxFontSize,
                  description: description,
                  overflow: overflow,
                  source: source,
                  title: title,
                  logo: logo,
                  date: date,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

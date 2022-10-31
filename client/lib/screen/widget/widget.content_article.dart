import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_all/flutter_html_all.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'widget.dart';

class ArticleContentAppBar extends DefaultAppBar {
  const ArticleContentAppBar({
    Key? key,
    required this.actions,
    required this.image,
    required this.title,
    required this.onPop,
  }) : super(key: key);

  final List<Widget> actions;
  final VoidCallback? onPop;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      centerTitle: false,
      leading: CupertinoButton(
        minSize: 0.0,
        onPressed: onPop,
        padding: EdgeInsets.zero,
        child: const BackButtonIcon(),
      ),
    );
  }
}

class ArticleContentImage extends StatelessWidget {
  const ArticleContentImage({
    Key? key,
    required this.image,
    required this.logo,
    required this.id,
  }) : super(key: key);

  final String image;
  final String logo;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Hero(tag: id, child: CachedNetworkImageSharedWidget(image: image));
  }
}

class ArticleContentHtml extends StatelessWidget {
  const ArticleContentHtml({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Html(
      data: data,
      customRenders: {
        iframeMatcher(): iframeRender(
          navigationDelegate: (request) {
            return NavigationDecision.navigate;
          },
        ),
      },
      style: {
        "body": Style(
          fontFamily: FontFamily.playfairDisplay,
          color: theme.colorScheme.onSecondary,
          lineHeight: LineHeight.em(1.1),
          fontSize: FontSize.large,
          letterSpacing: 0.1,
          wordSpacing: 0.2,
        ),
        "strong,b,h1,h2,h3,h4,h5,h6": Style(
          color: theme.colorScheme.onSurface.withOpacity(0.85),
        ),
      },
    );
  }
}

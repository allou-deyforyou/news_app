import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget.dart';

class MediaContentAppBar extends DefaultAppBar {
  const MediaContentAppBar({
    Key? key,
    this.openSearch,
  }) : super(key: key);

  final VoidCallback? openSearch;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        CupertinoButton(
          onPressed: openSearch,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: const Icon(CupertinoIcons.ellipsis_circle),
        ),
      ],
    );
  }
}

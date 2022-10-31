import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/locale.dart';

import 'widget.dart';

class HomeLibraryAppBar extends DefaultAppBar {
  const HomeLibraryAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Bibliothèque'),
    );
  }
}

class HomeLibraryItemWidget extends StatelessWidget {
  const HomeLibraryItemWidget({
    Key? key,
    required this.confirmDismiss,
    required this.source,
    required this.title,
    required this.onTap,
    required this.image,
    required this.date,
    required this.link,
  }) : super(key: key);

  final ConfirmDismissCallback? confirmDismiss;
  final VoidCallback? onTap;

  final String source;
  final DateTime date;
  final String title;
  final String image;
  final String link;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    const padding = EdgeInsets.symmetric(horizontal: 12.0);
    final locale = Locale.parse(Platform.localeName).languageCode;
    return Dismissible(
      confirmDismiss: confirmDismiss,
      background: Container(
        padding: padding,
        alignment: Alignment.centerLeft,
        color: CupertinoColors.destructiveRed,
        child: const Icon(CupertinoIcons.trash),
      ),
      secondaryBackground: Container(
        padding: padding,
        alignment: Alignment.centerRight,
        color: CupertinoColors.destructiveRed,
        child: const Icon(CupertinoIcons.trash),
      ),
      key: ValueKey(link),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        leading: Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
            width: 80.0,
            child: CachedNetworkImageSharedWidget(image: image),
          ),
        ),
        title: AutoSizeText(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(height: 1.2),
          minFontSize: theme.textTheme.titleMedium!.fontSize!,
        ),
        subtitle: DefaultTextStyle(
          style: theme.textTheme.bodySmall!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(source),
              Text(timeago.format(date, locale: locale).capitalize()),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeLibrarySearchTextField extends StatelessWidget {
  const HomeLibrarySearchTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: CupertinoSearchTextField(
        prefixInsets: const EdgeInsetsDirectional.fromSTEB(5, 0, 2, 2),
        controller: controller,
      ),
    );
  }
}

class HomeLibraryModal extends StatelessWidget {
  const HomeLibraryModal({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return AlertDialog(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(
          18.0,
        ),
      ),
      buttonPadding: EdgeInsets.zero,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            margin: const EdgeInsets.only(right: 8.0),
            clipBehavior: Clip.hardEdge,
            child: SizedBox.square(
              dimension: 30.0,
              child: CachedNetworkImageSharedWidget(image: image),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              maxFontSize: theme.textTheme.titleSmall!.fontSize!,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
      content: const Text(
        "Êtes-vous sûr(e) de vouloir supprimer cet article ?",
      ),
      actions: [
        const Divider(),
        CupertinoDialogAction(
          child: const Text('Annuler'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const Divider(),
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: const Text('Supprimer'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }
}

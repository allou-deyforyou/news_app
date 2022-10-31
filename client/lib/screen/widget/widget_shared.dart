import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/locale.dart';

import 'widget.dart';

class PostItemSharedWidget extends StatelessWidget {
  const PostItemSharedWidget({
    Key? key,
    required this.description,
    required this.maxFontSize,
    this.titleMaxLines = 4,
    required this.source,
    required this.logo,
    this.overflow,
    this.title,
    this.date,
  }) : super(key: key);

  final String description;
  final double maxFontSize;
  final int titleMaxLines;
  final String source;
  final String logo;

  final TextOverflow? overflow;
  final DateTime? date;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    const padding = EdgeInsets.symmetric(horizontal: 12.0);
    final locale = Locale.parse(Platform.localeName).languageCode;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Visibility(
          visible: date != null,
          child: Builder(
            builder: (context) {
              return ListTile(
                contentPadding: padding,
                visualDensity: const VisualDensity(
                  vertical: VisualDensity.minimumDensity,
                  horizontal: VisualDensity.minimumDensity,
                ),
                subtitle: Text(
                  timeago.format(date!, locale: locale).capitalize(),
                ),
              );
            },
          ),
        ),
        Visibility(
          visible: title != null,
          child: Builder(
            builder: (context) {
              return Padding(
                padding: padding,
                child: AutoSizeText(
                  title!,
                  overflow: overflow,
                  maxLines: titleMaxLines,
                  maxFontSize: maxFontSize,
                  minFontSize: theme.textTheme.headline6!.fontSize!,
                  style: theme.textTheme.headline4?.copyWith(
                    fontFamily: FontFamily.playfairDisplay,
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
        ListTile(
          contentPadding: padding,
          leading: CircleAvatarSharedWidget(avatar: logo),
          title: Text(
            '$source ( $description )',
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: theme.textTheme.headline1?.color),
          ),
        ),
      ],
    );
  }
}

class CircleAvatarSharedWidget extends StatelessWidget {
  const CircleAvatarSharedWidget({
    Key? key,
    required this.avatar,
  }) : super(key: key);
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: avatar,
          ),
        ),
      ),
    );
  }
}

class CachedNetworkImageSharedWidget extends StatefulWidget {
  const CachedNetworkImageSharedWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  State<CachedNetworkImageSharedWidget> createState() =>
      _CachedNetworkImageSharedWidgetState();
}

class _CachedNetworkImageSharedWidgetState
    extends State<CachedNetworkImageSharedWidget> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) {
        return const Center(child: CustomCircleProgessIndicator());
      },
      imageBuilder: (context, imageProvider) => Image(
        image: imageProvider,
        fit: BoxFit.cover,
      ),
      errorWidget: (context, url, error) {
        return InkWell(
          child: const Icon(CupertinoIcons.refresh),
          onTap: () => setState(() {}),
        );
      },
      fit: BoxFit.cover,
      imageUrl: widget.image,
    );
  }
}

class CircleProgressIndicatorSharedWidget extends StatelessWidget {
  const CircleProgressIndicatorSharedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      shape: CircleBorder(),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: CustomCircleProgessIndicator(),
      ),
    );
  }
}

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({
    Key? key,
    required this.message,
    required this.onPressed,
  }) : super(key: key);

  final String message;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message, style: theme.textTheme.headline6),
        const SizedBox(height: 12.0),
        OutlinedButton(
          onPressed: onPressed,
          child: const Text('Appuyer pour réessayer'),
        ),
      ],
    );
  }
}

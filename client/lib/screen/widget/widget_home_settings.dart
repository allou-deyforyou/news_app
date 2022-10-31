import 'package:flutter/material.dart';

import 'widget.dart';

class HomeSettingAppBar extends DefaultAppBar {
  const HomeSettingAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: preferredSize.height,
      title: const Text("Paramètres"),
    );
  }
}

class HomeSettingListTile extends StatelessWidget {
  const HomeSettingListTile({
    Key? key,
    required this.leading,
    required this.title,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Widget? trailing;
  final Widget? leading;

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      horizontalTitleGap: 8.0,
      title: Text(title),
      trailing: trailing,
      leading: leading,
      onTap: onTap,
    );
  }
}

class HomeSettingIcon extends StatelessWidget {
  const HomeSettingIcon({
    Key? key,
    required this.child,
    required this.color,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: ShapeDecoration(
        color: color,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: child,
    );
  }
}

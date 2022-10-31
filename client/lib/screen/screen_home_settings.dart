import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screen.dart';

class HomeSettingScreen extends StatelessWidget {
  const HomeSettingScreen({Key? key}) : super(key: key);

  static const name = 'home_setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeSettingAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeSettingListTile(
              leading: const HomeSettingIcon(
                color: CupertinoColors.activeBlue,
                child: Icon(CupertinoIcons.globe),
              ),
              title: 'Choisir un pays',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: HomeSettingListTile(
              trailing: CupertinoSwitch(
                onChanged: (value) {},
                value: true,
              ),
              leading: const HomeSettingIcon(
                color: CupertinoColors.activeOrange,
                child: Icon(CupertinoIcons.bell_fill),
              ),
              title: 'Activer la notification',
              onTap: () {},
            ),
          ),
          // SliverToBoxAdapter(
          //   child: HomeSettingListTile(
          //     leading: const HomeSettingIcon(
          //       color: CupertinoColors.activeBlue,
          //       child: Icon(CupertinoIcons.color_filter_fill),
          //     ),
          //     title: 'Definir un theme',
          //     onTap: () {},
          //   ),
          // ),
          SliverToBoxAdapter(
            child: HomeSettingListTile(
              leading: const HomeSettingIcon(
                color: CupertinoColors.activeGreen,
                child: Icon(CupertinoIcons.info),
              ),
              title: 'Aide',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: HomeSettingListTile(
              leading: const HomeSettingIcon(
                color: CupertinoColors.systemRed,
                child: Icon(CupertinoIcons.heart_fill),
              ),
              title: 'Partager à un ami',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

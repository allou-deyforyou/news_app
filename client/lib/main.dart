import 'package:flutter/material.dart';

import 'screen/screen.dart';

void main() async {
  // await runService(const ProductionService());
  await runService(const DevelopmentService());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    final articleStorageBucket = PageStorageBucket();
    _router = GoRouter(
      urlPathStrategy: UrlPathStrategy.path,
      routes: [
        GoRoute(
          path: HomeScreen.path,
          name: HomeScreen.name,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: HomeScreen(),
            );
          },
          routes: [
            GoRoute(
              path: ArticleContentScreen.path,
              name: ArticleContentScreen.name,
              pageBuilder: (context, state) {
                final post = state.extra as ArticlePost;
                return CustomTransitionPage(
                  child: PageStorage(
                    bucket: articleStorageBucket,
                    child: ArticleContentScreen(
                      key: PageStorageKey(post.link),
                      post: post,
                    ),
                  ),
                  transitionsBuilder: (_, __, ___, child) {
                    return child;
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: CustomBuildContext.localizationsDelegates,
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      supportedLocales: CustomBuildContext.supportedLocales,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
      color: Themes.secondaryColor,
      theme: Themes.darkTheme,
      title: 'News',
    );
  }
}

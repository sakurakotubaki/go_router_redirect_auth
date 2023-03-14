import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_routet_redirect/application/ui/home_page.dart';
import 'package:go_routet_redirect/application/ui/next_page.dart';
import 'package:go_routet_redirect/application/ui/start_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: <RouteBase>[
      // 最初に表示されるページ.
      GoRoute(
        path: '/', // トップレベルのパスが必要なので指定する.
        name: StartScreen.rootName, // 名前付きルートを指定する.
        builder: (BuildContext context, GoRouterState state) {
          return const StartScreen();
        },
        // ネストしたルートを指定する.
        routes: <RouteBase>[
          GoRoute(
            path: 'next',
            name: NextPage.rootName,
            builder: (BuildContext context, GoRouterState state) {
              return const NextPage();
            },
          ),
        ],
      ),
      // ネストしていないルート。戻るボタンがAppBarに表示されない.
      GoRoute(
        path: '/home',
        name: HomePage.rootName,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
    ],
  );
});

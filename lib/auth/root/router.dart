import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_routet_redirect/auth/root/auth_provider.dart';
import 'package:go_routet_redirect/auth/ui/profile/create_profile.dart';
import 'package:go_routet_redirect/auth/ui/profile/profile_page.dart';
import 'package:go_routet_redirect/auth/ui/signin_page.dart';
import 'package:go_routet_redirect/auth/ui/signup_page.dart';
import 'package:go_routet_redirect/auth/ui/start_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  final userState = ref.watch(userInfoProvider);

  return GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        // 最初に表示されるページ.
        GoRoute(
          path: '/', // トップレベルのパスが必要なので指定する.
          name: StartScreen.rootName, // 名前付きルートを指定する.
          builder: (BuildContext context, GoRouterState state) {
            return const StartScreen();
          },
        ),
        // ネストしていないルート。戻るボタンがAppBarに表示されない.
        // トップレベルのルートになるので、 / をつける
        GoRoute(
          path: '/signin',
          name: SignInPage.rootName,
          builder: (BuildContext context, GoRouterState state) {
            return const SignInPage();
          },
        ),
        GoRoute(
          path: '/signup',
          name: SignUpPage.rootName,
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpPage();
          },
        ),
        GoRoute(
          path: '/create',
          name: CreateProfile.rootName,
          builder: (BuildContext context, GoRouterState state) {
            return const CreateProfile();
          },
        ),
        GoRoute(
          path: '/profile',
          name: ProfilePage.rootName,
          builder: (BuildContext context, GoRouterState state) {
            return const ProfilePage();
          },
        ),
      ],
      // リダイレクトの処理
      redirect: (BuildContext context, GoRouterState state) {
        if (authState.isLoading || authState.hasError) return null;
        // GoRouterStateの機能でログインしていなければ
        // 最初に表示されるページへ画面遷移する
        final isStart = state.location == '/';
        // ログインしているか判定する変数
        final isAuth = authState.valueOrNull != null;

        // ユーザープロフィールが入力済みです。
        final userProfileCompleted =
            userState.valueOrNull?.data()?['name'] != null;

        // ユーザーがスタートページへ来ようとしていて、ログインしてなければ素通りさせる。
        if (isStart && !isAuth) {
          return null;
        }
        // isStartでなければ巣取りさせて良い。
        if (!isStart) {
          return null;
        }

        // ログインしていてuserコレクションが取得できれば、HomePageへ
        if (isAuth && userProfileCompleted) {
          return '/profile';
          // ログインしていてuserコレクションが取得できればお店のページへ
        } else if (isAuth && !userProfileCompleted) {
          return '/create';
          // ログインしていない状態で、コレクションが取得できなければ、
          // ! bool値を反転
          // Authの情報が存在していなくて、かつ一般ユーザーの情報がなければ、
          // ログインボタンと新規登録のボタンがあるページへ移動する。
        } else if (!isAuth && !userProfileCompleted) {
          return '/';
        }
      });
});

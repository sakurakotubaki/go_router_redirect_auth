import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_routet_redirect/auth/auth.dart';
import 'package:go_routet_redirect/auth/ui/home_page.dart';
import 'package:go_routet_redirect/auth/ui/next_page.dart';
import 'package:go_routet_redirect/auth/ui/profile/create_profile.dart';
import 'package:go_routet_redirect/auth/ui/profile/profile_page.dart';
import 'package:go_routet_redirect/auth/ui/profile/shop_page.dart';
import 'package:go_routet_redirect/auth/ui/signin_page.dart';
import 'package:go_routet_redirect/auth/ui/signup_page.dart';
import 'package:go_routet_redirect/auth/ui/start_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  final userState = ref.watch(userInfoProvider);
  final shopState = ref.watch(shopInfoProvider);

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
        // トップレベルのルートになるので、 / をつける
        GoRoute(
          path: '/home',
          name: HomePage.rootName,
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
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
        GoRoute(
          path: '/shop',
          name: ShopPage.rootName,
          builder: (BuildContext context, GoRouterState state) {
            return const ShopPage();
          },
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) {
        if (authState.isLoading || authState.hasError) return null;

        final isStart = state.location == StartScreen.rootName;

        final isAuth = authState.valueOrNull != null;
        // !=をつけると変数がbool型になる。
        final isUser = userState.valueOrNull?.data() != null;

        // ユーザープロフィールが入力済みです。
        final userProfileCompleted =
            userState.valueOrNull?.data()?['name'] != null;

        // お店プロフィールが入力済みです。
        final shopProfileCompleted =
            shopState.valueOrNull?.data()?['name'] != null;

        final isShop = shopState.valueOrNull?.data() != null;

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
          // ログインしていてshopコレクションが取得できればお店のページへ
        } else if (isAuth && shopProfileCompleted) {
          return '/shop';
          // ログインしているけど、shopのコレクションのデータがなければshop作成ページへ
        } else if (isAuth && !isShop) {
          return '/create';
          // ログインしているけど、コレクションのデータがなければユーザー登録ページへ
        } else if (isAuth && !isUser) {
          return '/create';
          // ログインしていない状態で、コレクションが取得できなければ、
          // ! bool値を反転
          // Authの情報が存在していなくて、かつショップか一般ユーザーの情報がなければ、
          // ログインボタンと新規登録のボタンがあるページへ移動する。
        } else if (!isAuth && !isUser || !isShop) {
          return '/';
        }
      });
});

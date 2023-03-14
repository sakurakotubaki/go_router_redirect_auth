import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_routet_redirect/auth/ui/home_page.dart';
import 'package:go_routet_redirect/auth/ui/next_page.dart';
import 'package:go_routet_redirect/auth/ui/signin_page.dart';
import 'package:go_routet_redirect/auth/ui/signup_page.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});
  static const rootName = '/'; // 名前付きルートで使うコンストラクターを定義しておく.

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Auth Start Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Wellcome"),
            ElevatedButton(
              onPressed: () {
                // 名前付きルートで画面遷移するコード.
                // ネストしたルートに画面遷移する.
                context.goNamed(NextPage.rootName);
              },
              child: const Text("NextPage"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 名前付きルートで画面遷移するコード.
                // 通常の画面遷移をするコード.
                context.goNamed(HomePage.rootName);
              },
              child: const Text("HomePage"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 名前付きルートで画面遷移するコード.
                // 通常の画面遷移をするコード.
                context.goNamed(SignInPage.rootName);
              },
              child: const Text("SignInPage"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 名前付きルートで画面遷移するコード.
                // 通常の画面遷移をするコード.
                context.goNamed(SignUpPage.rootName);
              },
              child: const Text("SignUpPage"),
            ),
          ],
        ),
      ),
    );
  }
}

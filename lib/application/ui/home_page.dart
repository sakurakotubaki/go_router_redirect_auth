import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_routet_redirect/application/ui/start_screen.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const rootName = 'homePage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomePage")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome to NextPage"),
            ElevatedButton(
              onPressed: () {
                context.goNamed(StartScreen.rootName);
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}

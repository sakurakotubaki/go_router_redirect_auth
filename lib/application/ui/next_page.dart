import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NextPage extends ConsumerWidget {
  const NextPage({super.key});
  static const rootName = 'nextPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("NextPage")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome to NextPage"),
            ElevatedButton(
              onPressed: () {
                // 前のページへ戻るコード
                context.pop();
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}

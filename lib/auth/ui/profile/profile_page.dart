import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_routet_redirect/auth/ui/start_screen.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});
  static const rootName = 'profilePage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("ProfilePage")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Welcome to profilePage"),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (context.mounted) {
                  context.goNamed(StartScreen.rootName);
                }
              },
              child: const Text("SignOut"),
            ),
          ],
        ),
      ),
    );
  }
}

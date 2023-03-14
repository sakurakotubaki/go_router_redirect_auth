import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_routet_redirect/auth/auth.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});
  static const rootName = 'SignInPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _email = ref.watch(emailProvider);
    final _password = ref.watch(passwordProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("SignInPage")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _email,
            ),
            TextField(
              controller: _password,
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _email.text, password: _password.text);
              },
              child: const Text("SignIn"),
            ),
          ],
        ),
      ),
    );
  }
}

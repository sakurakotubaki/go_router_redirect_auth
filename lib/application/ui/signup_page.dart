import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_routet_redirect/auth/auth.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});
  static const rootName = 'signUpPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _email = ref.watch(emailProvider);
    final _password = ref.watch(passwordProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("SignUpPage")),
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
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _email.text, password: _password.text);
              },
              child: const Text("SignUp"),
            ),
          ],
        ),
      ),
    );
  }
}

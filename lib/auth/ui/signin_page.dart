import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_routet_redirect/auth/root/auth_provider.dart';

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
               try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _email.text, password: _password.text);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'invalid-email') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('メールアドレスのフォーマットが正しくありません'),
                    ),
                  );
                } else if (e.code == 'user-disabled') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('現在指定したメールアドレスは使用できません'),
                    ),
                  );
                } else if (e.code == 'user-not-found') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('指定したメールアドレスは登録されていません'),
                    ),
                  );
                } else if (e.code == 'wrong-password') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('パスワードが間違っています'),
                    ),
                  );
                }
              }
              },
              child: const Text("SignIn"),
            ),
          ],
        ),
      ),
    );
  }
}

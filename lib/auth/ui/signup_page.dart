import 'package:cloud_firestore/cloud_firestore.dart';
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
                // final uid = await FirebaseAuth.instance.currentUser?.uid;
                // await FirebaseFirestore.instance
                //     .collection('user')
                //     .doc(uid)
                //     .set({'createdAt': Timestamp.fromDate(DateTime.now())});
              },
              child: const Text("User SignUp"),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _email.text, password: _password.text);
                  // final uid = await FirebaseAuth.instance.currentUser?.uid;
                  // await FirebaseFirestore.instance
                  //     .collection('shop')
                  //     .doc(uid)
                  //     .set({'createdAt': Timestamp.fromDate(DateTime.now())});
                },
                child: const Text("Shop SignUp")),
          ],
        ),
      ),
    );
  }
}
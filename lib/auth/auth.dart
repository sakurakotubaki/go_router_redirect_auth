import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// With firebase I often find myself writing simple providers
// Usually, stream-based redirects is more than enough.
// Most of the auth-related logic is handled by the SDK
final authProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

// Note how it is totally possible to append custom logic or notifiers in between
// I personally don't like to overcomplicate things, but the sky's the limit!

// メールアドレスのテキストを保存するProvider
final emailProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final passwordProvider = StateProvider.autoDispose((ref) {
  // パスワードのテキストを保存するProvider
  return TextEditingController(text: '');
});

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final userInfoProvider = StreamProvider((ref) {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final docRef = FirebaseFirestore.instance.collection('user');
  final fetch = docRef.doc(uid).snapshots();
  return fetch;
});

final shopInfoProvider = StreamProvider((ref) {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final docRef = FirebaseFirestore.instance.collection('shop');
  final fetch = docRef.doc(uid).snapshots();
  return fetch;
});

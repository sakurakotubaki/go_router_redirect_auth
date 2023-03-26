import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ユーザーのログイン状態を維持するプロバイダー
final authProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

// メールアドレスのテキストを保存するProvider
final emailProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

// パスワードのテキストを保存するProvider
final passwordProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

// Firestoreをインスタンス化するプロバイダー
final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

// Firestoreからリアルタイムでuserコレクションのデータを取得するプロバイダー　
final userInfoProvider = StreamProvider((ref) {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final docRef = FirebaseFirestore.instance.collection('user');
  final fetch = docRef.doc(uid).snapshots();
  return fetch;
});

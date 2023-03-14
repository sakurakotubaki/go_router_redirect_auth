// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:go_routet_redirect/auth/auth.dart';
// import 'package:go_routet_redirect/auth/screen.dart';
//
// class UserSignUp extends ConsumerWidget {
//   const UserSignUp({super.key});
//   static String get routeName => 'userEmail';
//   static String get routeLocation => '/$routeName';
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final _email = ref.watch(emailProvider);
//     final _password = ref.watch(passwordProvider);
//
//     return Scaffold(
//       appBar: null,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text("ユーザーアカウントを作成"),
//             TextField(
//               controller: _email,
//             ),
//             TextField(
//               controller: _password,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await FirebaseAuth.instance.createUserWithEmailAndPassword(
//                       email: _email.text, password: _password.text);
//
//                   if (context.mounted) {
//                     context.goNamed(NewUserPage.routeLocation);
//                   }
//                 } catch (e) {
//                   log(e.toString());
//                 }
//               },
//               child: const Text("一般で新規作成"),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await FirebaseAuth.instance.createUserWithEmailAndPassword(
//                       email: _email.text, password: _password.text);
//
//                   if (context.mounted) {
//                     context.goNamed(NewShopPage.routeLocation);
//                   }
//                 } catch (e) {
//                   log(e.toString());
//                 }
//               },
//               child: const Text("お店で新規作成"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ShopSignUp extends ConsumerWidget {
//   const ShopSignUp({super.key});
//   static String get routeName => 'shopEmail';
//   static String get routeLocation => '/$routeName';
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final _email = ref.watch(emailProvider);
//     final _password = ref.watch(passwordProvider);
//
//     return Scaffold(
//       appBar: null,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text("ユーザーアカウントを作成"),
//             TextField(
//               controller: _email,
//             ),
//             TextField(
//               controller: _password,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await FirebaseAuth.instance.createUserWithEmailAndPassword(
//                       email: _email.text, password: _password.text);
//
//                   if (context.mounted) {
//                     context.goNamed(NewUserPage.routeLocation);
//                   }
//                 } catch (e) {
//                   log(e.toString());
//                 }
//               },
//               child: const Text("一般で新規作成"),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await FirebaseAuth.instance.createUserWithEmailAndPassword(
//                       email: _email.text, password: _password.text);
//
//                   if (context.mounted) {
//                     context.goNamed(NewShopPage.routeLocation);
//                   }
//                 } catch (e) {
//                   log(e.toString());
//                 }
//               },
//               child: const Text("お店で新規作成"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

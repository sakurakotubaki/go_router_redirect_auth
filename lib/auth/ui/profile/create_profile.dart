import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_routet_redirect/auth/ui/profile/profile_page.dart';

final nameProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

class CreateProfile extends ConsumerWidget {
  const CreateProfile({super.key});
  static const rootName = 'createProfile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _name = ref.watch(nameProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("CreateProfile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _name,
            ),
            ElevatedButton(
              onPressed: () async {
                final uid = await FirebaseAuth.instance.currentUser?.uid;
                await FirebaseFirestore.instance
                    .collection('user')
                    .doc(uid)
                    .set({'name': _name.text});
                if (context.mounted) {
                  context.goNamed(ProfilePage.rootName);
                }
              },
              child: const Text("Profile Page"),
            ),
          ],
        ),
      ),
    );
  }
}

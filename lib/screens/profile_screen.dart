import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("USER PROFILE"),
          actions: [
            IconButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
                icon: const Icon(Icons.logout_outlined))
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 200.0,
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Name: ' + user.displayName!,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Email: ' + user.email!,
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ));
  }
}

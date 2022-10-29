import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:TextButton(child:Text("Sign out"),
                onPressed: () {
                  CoolAlert.show(
                      context: context,
                      type: CoolAlertType.confirm,
                      onConfirmBtnTap: () {
                        FirebaseAuth.instance.signOut();
                        final GoogleSignIn googleSignIn = new GoogleSignIn();
                        googleSignIn.isSignedIn().then((s) {
                          googleSignIn.signOut();
                        });
                        Navigator.pop(context);
                      },
                      text: "Are you sure you want to log out");
                },
    ));
  }
}

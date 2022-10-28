import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../styles.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _namecontroller = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpwController = TextEditingController();
  bool _obscured = true;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpwController.dispose();
    _namecontroller.dispose();
    super.dispose();
  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  bool isPassword() {
    if (_passwordController.text.trim() == _confirmpwController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future signUp() async {
    if (isPassword()) {
      //create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buttondecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Create your account",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        cursorColor: primaryOrange,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryOrange),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'E-mail',
                            fillColor: Colors.grey[100],
                            filled: true),
                      ),
                      SizedBox(height: 10),
                      //name
                      TextFormField(
                        controller: _namecontroller,
                        cursorColor: primaryOrange,
                        decoration: InputDecoration(
                            // errorText: _errorName,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryOrange),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Name',
                            fillColor: Colors.grey[100],
                            filled: true),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _passwordController,
                        cursorColor: primaryOrange,
                        obscureText: _obscured,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryOrange),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Password',
                            fillColor: Colors.grey[100],
                            filled: true),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _confirmpwController,
                        cursorColor: primaryOrange,
                        obscureText: _obscured,
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: _toggleObscured,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  child: Icon(
                                      _obscured
                                          ? FlutterRemix.eye_close_line
                                          : FlutterRemix.eye_line,
                                      color: primaryOrange),
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryOrange),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Confirm Password',
                            fillColor: Colors.grey[100],
                            filled: true),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: signUp,
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                primaryOrange,
                                secondaryOrange,
                              ],
                            ),
                          ),
                          child: Center(
                              child: Text(
                            "Sign up",
                            style: buttonText,
                          )),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: primaryOrange)))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:akkredit/auth/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../styles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscured = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                        "Welcome back!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      //email
                      TextField(
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
                      //password
                      TextField(
                        controller: _passwordController,
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
                            hintText: 'Password',
                            fillColor: Colors.grey[100],
                            filled: true),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: signIn,
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
                            "Sign In",
                            style: buttonText,
                          )),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return SignUp();
                                  },
                                ));
                              },
                              child: Text("Sign up",
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

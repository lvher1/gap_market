import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.greenAccent, Colors.blueAccent])),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200,
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Image(image: AssetImage('assets/gap.png'),fit: BoxFit.fill,),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              SizedBox(
                child: Text(
                  '틈새 시장',
                  style: TextStyle(fontSize: 50, color: Colors.blueAccent),
                ),
                height: 100,
              ),
              SizedBox(
                height: 50,
              ),
              Text('구글 로그인',style: TextStyle(fontSize: 30,color:Colors.white),),
              IconButton(
                  onPressed: signInWithGoogle,
                  icon: Icon(FontAwesomeIcons.google,color: Colors.white,),),
            ],
          ),
        ),
      ),
    );
  }
}

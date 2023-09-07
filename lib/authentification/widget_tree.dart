import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap_market/authentification/login.dart';
import 'package:gap_market/main.dart';
import 'package:gap_market/sub/whole.dart';


class WidgetTree extends StatefulWidget{
  const WidgetTree({Key? key}) : super(key:key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}
class _WidgetTreeState extends State<WidgetTree>{
  @override
  Widget build(BuildContext context){
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),builder: (context,snapshot){
      if(snapshot.hasData){
        return const MainPage();
      }else{
        return const Login();
      }
    },);
  }
}
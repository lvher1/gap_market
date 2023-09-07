import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap_market/authentification/widget_tree.dart';
import 'package:gap_market/sub/major.dart';
import 'package:gap_market/sub/mine.dart';
import 'package:gap_market/sub/subject.dart';
import 'package:gap_market/sub/whole.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "gap_market1",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WidgetTree(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{
  int _selectedIndex = 0;
  User? user = Auth().currentUser;
  @override
  void initState() {
    super.initState();
    //controller = TabController(length: 4, vsync: this);
    //length: tab개수, vsync: tab이동시 호출되는 콜백함수 처리 위치 지정
  }
  @override
  void dispose() {
    //controller.dispose();
    super.dispose();
  }
  List<Widget> _widgetOptions = <Widget>[
    Whole(),
    Major(),
    Subject(),
    Mine()
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(child: Text(''))
          ],
        ),
      ),
      appBar: AppBar(

      ),
      body: SafeArea(
      child: _widgetOptions.elementAt(_selectedIndex),
    ),
      bottomNavigationBar: ClipRRect(

        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0)),
          child: BottomNavigationBar(

            type: BottomNavigationBarType.shifting,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.a),label: '모두'),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.a),label: '전공'),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.a),label: '과목'),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.a),label: '내꺼')
            ],
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
          ),
        )
      )

    );
  }
}

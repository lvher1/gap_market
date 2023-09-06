import 'package:flutter/material.dart';
class Whole extends StatefulWidget {
  const Whole({super.key});

  @override
  State<Whole> createState() => _WholeState();
}

class _WholeState extends State<Whole> {
  PageController controller = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        Container(margin: EdgeInsets.all(20),color:Colors.lightGreen)
      ],
    );
  }
}

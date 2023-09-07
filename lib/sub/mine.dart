import 'package:flutter/material.dart';
class Mine extends StatefulWidget {
  const Mine({super.key});

  @override
  State<Mine> createState() => _MineState();
}

class _MineState extends State<Mine> {
  PageController controller = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );

  @override
  Widget build(BuildContext context) {

    return PageView(
      controller: controller,
      children: [

      ],
    );
  }
}

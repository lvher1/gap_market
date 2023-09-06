import 'package:flutter/material.dart';
class Major extends StatefulWidget {
  const Major({super.key});

  @override
  State<Major> createState() => _MajorState();
}

class _MajorState extends State<Major> {
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

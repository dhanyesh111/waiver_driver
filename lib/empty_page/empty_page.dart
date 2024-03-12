import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  String? text;
  EmptyPage({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text ?? "No Data found");
  }
}

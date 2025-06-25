import 'dart:ui'; //imagefilter ki avasaram
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:_36inaday/main.dart';

class note extends StatefulWidget {
  const note({super.key});

  @override
  State<note> createState() => _noteState();
}

class _noteState extends State<note> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.all(4),
        child: Column(children: []),
      ),
    );
  }
}

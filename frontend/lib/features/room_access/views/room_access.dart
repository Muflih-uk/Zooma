import 'package:flutter/material.dart';

class RoomController extends StatelessWidget {
  const RoomController({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(),
          ),
        ),
      ),
    );
  }
}
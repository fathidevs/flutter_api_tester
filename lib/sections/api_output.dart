import 'package:flutter/material.dart';

class ApiOutput extends StatefulWidget {
  const ApiOutput({super.key, required this.data});
  final dynamic data;
  @override
  State<ApiOutput> createState() => _ApiOutputState();
}

class _ApiOutputState extends State<ApiOutput> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.data.toString());
  }
}

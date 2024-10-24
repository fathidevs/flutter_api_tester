import 'package:flutter/material.dart';
import 'package:flutter_api_tester/sections/api_input.dart';
import 'package:flutter_api_tester/sections/api_output.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic _res;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * .5,
          child: Column(
            children: [
              Expanded(child: ApiInput(
                onSubmit: (response) {
                  setState(() {
                    _res = response;
                  });
                },
              )),
              Expanded(child: ApiOutput(data: _res)),
            ],
          ),
        ),
      ),
    );
  }
}

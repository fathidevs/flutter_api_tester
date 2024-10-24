import 'package:flutter/material.dart';
import 'package:flutter_api_tester/api.dart';

class ApiInput extends StatefulWidget {
  const ApiInput({super.key, required this.onSubmit(dynamic jsonResponse)});
  final Function onSubmit;
  @override
  State<ApiInput> createState() => _ApiInputState();
}

class _ApiInputState extends State<ApiInput> {
  String _groupValue = 'get';
  final String _msg = 'Will be available soon';
  final TextEditingController _ctrl = TextEditingController();
  bool _noUrl = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _rbtn(
                groupValue: 'get',
                onPressed: () => setState(() => _groupValue = 'get'),
                title: 'GET'),
            _rbtn(
                groupValue: 'post',
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(_msg)));

                  // setState(() => _groupValue = 'post');
                },
                title: 'POST'),
            _rbtn(
                groupValue: 'update',
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(_msg)));
                  // setState(() => _groupValue = 'update');
                },
                title: 'UPDATE'),
            _rbtn(
                groupValue: 'delete',
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(_msg)));
                  // setState(() => _groupValue = 'delete');
                },
                title: 'DELETE'),
          ],
        ),
        const SizedBox(height: 25.0),
        Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: _tf()),
            // Expanded(child: Center()),
            _btn(
                onPressed: () async {
                  dynamic s = await Api.get(_ctrl.text.toString().trim());
                  setState(() {
                    widget.onSubmit(s);
                  });
                  // print(s);
                },
                title: 'Submit'),
          ],
        ),
      ],
    );
  }

  Widget _tf() {
    return TextField(
      controller: _ctrl,
      keyboardType: TextInputType.url,
      onChanged: (_) {
        setState(() {
          if (_.isNotEmpty) {
            _noUrl = false;
          } else {
            _noUrl = true;
          }
        });
      },
      decoration: InputDecoration(
          isDense: true,
          hintText: 'paste your link',
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: _border(),
          focusedBorder: _border(borderColor: Colors.blue),
          prefixIcon: const Icon(Icons.link),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 50.0,
            maxHeight: 25.0,
          )),
    );
  }

  OutlineInputBorder _border({Color borderColor = Colors.grey}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(90.0),
    );
  }

  Widget _btn({
    required VoidCallback onPressed,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: _submitInvalid() ? null : onPressed,
        child: Text(title),
      ),
    );
  }

  bool _submitInvalid() {
    if (_noUrl) {
      return true;
    }

    return false;
  }

  Widget _rbtn({
    required VoidCallback onPressed,
    required String title,
    required String groupValue,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        style: _rbtnStyle(groupValue),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }

  ButtonStyle _rbtnStyle(String groupValue) {
    return ButtonStyle(
      backgroundColor: groupValue == _groupValue
          ? const WidgetStatePropertyAll(Colors.purple)
          : null,
      foregroundColor: groupValue == _groupValue
          ? const WidgetStatePropertyAll(Colors.white)
          : null,
    );
  }
}

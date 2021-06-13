import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String placeholder;
  final TextEditingController textFieldController;

  const TextFieldWidget({
    Key key,
    @required this.placeholder,
    @required this.textFieldController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 50,
        color: Colors.white,
        padding: const EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 20),
        child: TextField(
          controller: textFieldController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: new InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(5.0),
                ),
              ),
              // filled: true,
              hintStyle: new TextStyle(color: Colors.grey[400]),
              hintText: placeholder,
              labelText: placeholder.replaceAll("Nhập số đ", "Đ"),
              fillColor: Colors.white),
        ));
  }
}

import 'package:assignment_fh_flutter_app/pages/login/components/text_field_container.dart';
import 'package:assignment_fh_flutter_app/utils/Constants.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: mWhiteTextColor,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintStyle:  TextStyle(color: Colors.white),
          icon: Icon(
            icon,
            color: mWhiteTextColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
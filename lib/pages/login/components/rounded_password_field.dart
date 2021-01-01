import 'package:assignment_fh_flutter_app/pages/login/components/text_field_container.dart';
import 'package:assignment_fh_flutter_app/utils/Constants.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle:  TextStyle(color: Colors.white),
          icon: Icon(
            Icons.lock,
            color: mWhiteTextColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: mWhiteTextColor,
          ),
          labelStyle: TextStyle(color: mWhiteTextColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
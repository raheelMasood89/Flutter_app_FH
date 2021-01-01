import 'package:assignment_fh_flutter_app/pages/home/HomePage.dart';
import 'package:assignment_fh_flutter_app/pages/login/components/rounded_button.dart';
import 'package:assignment_fh_flutter_app/pages/login/components/rounded_input_field.dart';
import 'package:assignment_fh_flutter_app/pages/login/components/rounded_password_field.dart';
import 'package:assignment_fh_flutter_app/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Background.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  Widget _title(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'LOGIN',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 50,
            fontWeight: FontWeight.w700,
            color: kPrimaryColor,
          ),
         ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _title(context),
            SizedBox(height: size.height * 0.03),
            Image.asset('assets/icons/login_02.png'),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/size.dart';
import '../../controllers/c_auth.dart';
import '../../helpers/keyboard.dart';
import '../../widget/w_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends LoginController {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          usernameField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          passwordField(),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (i) {
                  setState(() {
                    remember = i!;
                  });
                },
              ),
              Text(
                "Remember me",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(12.5),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => forgot(),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: getProportionateScreenWidth(12.5),
                  ),
                ),
              )
            ],
          ),
          loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Text(
                  msg,
                  style: const TextStyle(fontSize: 20.0, color: Colors.red),
                ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          DefaultButton(
            text: "Login",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                KeyboardUtil.hideKeyboard(context);
                cek();
              }
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Text(
            "or",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(12.5),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          DefaultButton(
            text: "Register",
            bgcolor: const Color.fromARGB(255, 11, 132, 212),
            press: () {
              register();
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
        ],
      ),
    );
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends RegisterController {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          usernameField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          fullnameField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          passwordField0(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          passwordField1(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          locationStatus
              ? Text(
                  "Koordinat : ($lon,$lat)",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(12),
                  ),
                  textAlign: TextAlign.left,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Text(
                  msg,
                  style: const TextStyle(fontSize: 20.0, color: Colors.red),
                ),
          DefaultButton(
            text: "Submit",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                KeyboardUtil.hideKeyboard(context);
                cek();
              }
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
        ],
      ),
    );
  }
}

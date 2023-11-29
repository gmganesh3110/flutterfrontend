import 'package:client/api/ApiService.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAsyncCallProcess = false;
  String? password;
  String? email;
  bool hidePassword = false;
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
          child: Form(
            key: globalKey,
            child: _loginUI(context, password, email, hidePassword),
          ),
          inAsyncCall: isAsyncCallProcess,
          key: UniqueKey(),
        ),
      ),
    );
  }

  bool validateSave() {
    final form = globalKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Widget _loginUI(context, password, email, hidePassword) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Center(
            child: Image.network(
              "https://png.pngtree.com/png-vector/20220220/ourlarge/pngtree-shopping-bag-png-image_4407886.png",
              fit: BoxFit.contain,
              width: 150,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: const Text(
              "Grocery App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Log In",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepOrangeAccent),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
            context,
            "email",
            "E-mail",
            (onValidate) {
              if (onValidate.isEmpty) {
                return "* Required";
              }
              return null;
            },
            (onSaved) {
              email = onSaved.toString().trim();
            },
            showPrefixIcon: true,
            prefixIcon: const Icon(Icons.email_outlined),
            borderRadius: 10,
            contentPadding: 15,
            fontSize: 14,
            prefixIconPaddingLeft: 10,
            borderColor: Colors.grey.shade400,
            textColor: Colors.black,
            prefixIconColor: Colors.black,
            hintColor: Colors.black.withOpacity(0.6),
            backgroundColor: Colors.grey.shade100,
            borderFocusColor: Colors.grey.shade200,
          ),
          const SizedBox(
            height: 20,
          ),
          FormHelper.inputFieldWidget(
            context,
            "passowrd",
            "Passowrd",
            (onValidate) {
              if (onValidate.isEmpty) {
                return "* Required";
              }
              return null;
            },
            (onSaved) {
              password = onSaved.toString().trim();
            },
            showPrefixIcon: true,
            prefixIcon: const Icon(Icons.visibility),
            borderRadius: 10,
            contentPadding: 15,
            fontSize: 14,
            prefixIconPaddingLeft: 10,
            borderColor: Colors.grey.shade400,
            textColor: Colors.black,
            prefixIconColor: Colors.black,
            hintColor: Colors.black.withOpacity(0.6),
            backgroundColor: Colors.grey.shade100,
            borderFocusColor: Colors.grey.shade200,
            obscureText: true,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              icon:
                  Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Log In",
              () {
                if (validateSave()) {
                  setState(() {
                    isAsyncCallProcess = true;
                  });
                  ApiService.loginuser(email, password).then(
                    (value) => {
                      setState(
                        () {
                          isAsyncCallProcess = false;
                        },
                      ),
                      if (value)
                        {
                          FormHelper.showSimpleAlertDialog(
                            context,
                            "Grocery App",
                            "Logged In Succefully",
                            "OK",
                            () {
                              Navigator.of(context).pop();
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/home', (route) => false);
                            },
                          )
                        }
                      else
                        {
                          FormHelper.showSimpleAlertDialog(
                            context,
                            "Grocery App",
                            "Invalid Email/Password",
                            "OK",
                            () {
                              Navigator.of(context).pop();
                            },
                          )
                        }
                    },
                  );
                }
              },
              btnColor: Colors.deepOrange,
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                children: <TextSpan>[
                  TextSpan(text: "Don't Have an Account"),
                  TextSpan(
                    text: "Sign Up",
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushReplacementNamed('/register');
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

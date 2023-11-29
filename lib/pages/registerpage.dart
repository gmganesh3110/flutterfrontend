import 'package:client/api/ApiService.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAsyncCallProcess = false;
  String? fullName;
  String? password;
  String? confirmPassword;
  String? email;
  bool hidePassword = false;
  bool hideConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
          child: Form(
            key: globalKey,
            child: _registerUI(context, fullName, password, confirmPassword,
                email, hidePassword, hideConfirmPassword),
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

  Widget _registerUI(BuildContext context, fullName, password, confirmPassword,
      email, hidePassword, hideConfirmPassword) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  "https://png.pngtree.com/png-vector/20220220/ourlarge/pngtree-shopping-bag-png-image_4407886.png",
                  fit: BoxFit.contain,
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Grocery App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          const Center(
            child: Text(
              "Register",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepOrangeAccent),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FormHelper.inputFieldWidget(
            context,
            "fullName",
            "fullName",
            (onValidate) {
              if (onValidate.isEmpty) {
                return "* Required";
              }
              return null;
            },
            (onSaved) {
              fullName = onSaved.toString().trim();
            },
            showPrefixIcon: true,
            prefixIcon: const Icon(Icons.face),
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
            "password",
            "Password",
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
            prefixIcon: const Icon(Icons.remove_red_eye),
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
          FormHelper.inputFieldWidget(
            context,
            "confirmPassowrd",
            "Confirm Password",
            (onValidate) {
              if (onValidate.isEmpty) {
                return "* Required";
              }
              return null;
            },
            (onSaved) {
              confirmPassword = onSaved.toString().trim();
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
            obscureText: true,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hideConfirmPassword = !hideConfirmPassword;
                });
              },
              icon: Icon(hideConfirmPassword
                  ? Icons.visibility_off
                  : Icons.visibility),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Sign Up",
              () {
                if (validateSave()) {
                  setState(() {
                    isAsyncCallProcess = true;
                  });
                  ApiService.registerUser(fullName, email, password).then(
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
                            "Registered Succfully",
                            "OK",
                            (onPressed) {
                              Navigator.of(context).pop();
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/login', (route) => false);
                            },
                          )
                        }
                      else
                        {
                          FormHelper.showSimpleAlertDialog(
                            context,
                            "Grocery App",
                            "Email Already Exists",
                            "OK",
                            (onPressed) {
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
          const SizedBox(
            height: 20,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                children: <TextSpan>[
                  TextSpan(text: "Already have an account?"),
                  TextSpan(
                    text: "Sign In",
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAPICallProcess = false;
  bool hidePassword = true;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  String? username;
  String? password;

  String colorFruithz = "#183e9e";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(colorFruithz),
        body: ProgressHUD(
          child: Form(
            child: _loginUI(context),
            key: globalFormKey,
          ),
          inAsyncCall: isAPICallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.white]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/logoPlaca.png",
                  width: 140,
                  fit: BoxFit.contain,
                ),
              )
            ]),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 30, top: 50),
            child: Text(
              "Login",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
          FormHelper.inputFieldWidget(context, "username", "UserName",
              (onValidateVal) {
            return onValidateVal.isEmpty ? "Usuario no puede ir vacio" : null;
          }, (onSavedVal) {
            username = onSavedVal;
          },
              prefixIcon: const Icon(Icons.person),
              showPrefixIcon: true,
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              textColor: Colors.white,
              borderColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(context, "password", "Password",
                (onValidateVal) {
              return onValidateVal.isEmpty
                  ? "La contraseña no puede ir vacio"
                  : null;
            }, (onSavedVal) {
              password = onSavedVal;
            },
                prefixIcon: const Icon(Icons.password),
                showPrefixIcon: true,
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                textColor: Colors.white,
                borderColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
                obscureText: hidePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility),
                  color: Colors.white.withOpacity(0.7),
                )),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: RichText(
                    text: TextSpan(
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Olvido su contraseña ?',
                        style: const TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Forget Password");
                          })
                  ],
                )),
              )),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton("Ingresar", () {
              if (validateAndSave()) {
                setState(() {
                  isAPICallProcess = true;
                });
              }
              if (username == "admin" && password == "admin") {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              }
            },
                btnColor: HexColor(colorFruithz),
                borderColor: Colors.white,
                txtColor: Colors.white,
                borderRadius: 10),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text("O",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white)),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: RichText(
                    text: TextSpan(
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                  children: <TextSpan>[
                    const TextSpan(text: "Todavia no tiene cuenta? "),
                    TextSpan(
                        text: 'Registrese',
                        style: const TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/register");
                          })
                  ],
                )),
              )),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

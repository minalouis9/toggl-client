import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toast/toast.dart';
import 'package:toggl_client_app/models/User.dart';
import 'package:toggl_client_app/models/responses/LoginResponse.dart';
import 'package:toggl_client_app/screens/Home.dart';
import 'package:toggl_client_app/services/APIClient.dart';
import 'package:toggl_client_app/utils/Colors.dart';
import 'package:toggl_client_app/utils/Images.dart';
import 'package:toggl_client_app/utils/InterfaceUtilities.dart';
import 'package:toggl_client_app/utils/LocalStorage.dart';
import 'package:toggl_client_app/widgets/Buttons.dart';
import 'package:toggl_client_app/widgets/TextInput.dart';
import 'package:toggl_client_app/widgets/Toast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();
  bool _isEmailError = false, _isPasswordError = false;
  IconData _emailIcon = Icons.email, _passwordIcon = Icons.vpn_key;

  final regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        // backgroundColor: Colors.grey[200],
        elevation: 0.0,
        title: SvgPicture.asset(
          ImportedImages.togglLogo,
          fit: BoxFit.fitWidth,
          width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.3),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(InterfaceUtilities.screenPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome back !",
                    style: TextStyle(
                        color: Color(0xff4A316E),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: InterfaceUtilities.containerPadding * 2)),
              TextInput(
                label: "Email",
                hint: "example@gmail.com",
                error: "Invalid email format",
                isError: _isEmailError,
                controller: _emailController,
                icon: _emailIcon,
                isObscure: false,
                inputType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    _isEmailError = false;
                  });
                },
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: InterfaceUtilities.containerPadding)),
              TextInput(
                label: "Password",
                hint: "Password",
                error: "Invalid password",
                isError: _isPasswordError,
                isObscure: true,
                controller: _passwordController,
                icon: _passwordIcon,
                inputType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    _isPasswordError = false;
                  });
                },
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: InterfaceUtilities.containerPadding * 2)),
              Container(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                      text: "Forget password ?",
                      style: TextStyle(color: Color(0xffAA70FA)),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: InterfaceUtilities.containerPadding * 2)),
              CustomButton(
                label: "Login",
                color: Theme.of(context).primaryColor,
                width:
                    InterfaceUtilities.getPercentageOfScreenWidth(context, 1.0),
                onPressed: () {
                  if (_emailController.text.isNotEmpty &&
                      regExp.hasMatch(_emailController.text)) {
                    if (_passwordController.text.isNotEmpty) {

                      APIClient()
                          .loginService()
                          .login(
                              _emailController.text, _passwordController.text)
                          .then((value) async {
                        if (value.containsKey(true)) {
                          context.read()<UserProvider>().onNewUser(value.values.first.user);
                          await LocalStorage().saveUser(value.values.first.user);
                          await LocalStorage().rememberUser();
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }), (route) => false);
                        } else {
                          FocusScope.of(context).unfocus();
                          showToast(context, "Login failed");
                        }
                      });
                    } else {
                      setState(() {
                        _isPasswordError = true;
                      });
                    }
                  } else {
                    setState(() {
                      _isEmailError = true;
                    });
                  }
                },
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: InterfaceUtilities.containerPadding * 2)),
              Text(
                "Don't have an account ?",
                textAlign: TextAlign.center,
              ),
              RichText(
                text: TextSpan(
                    text: "Sign Up",
                    style: TextStyle(color: Color(0xffAA70FA)),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

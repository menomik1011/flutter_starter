import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:core';
import 'package:get/get.dart';
import 'package:flutter_starter/ui/auth/auth.dart';
import 'package:flutter_starter/ui/components/components.dart';
import 'package:flutter_starter/helpers/helpers.dart';
import 'package:flutter_starter/controllers/controllers.dart';
import 'package:kakao_flutter_sdk/all.dart';

class SignInUI extends StatefulWidget {
  @override
  SignInUIState createState() => SignInUIState();
}

class SignInUIState extends State<SignInUI> {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _loginButtonPressed() async {
    String authCode = await AuthCodeClient.instance.request();
    var isKakaoInstalled = await isKakaoTalkInstalled();
    var tokenManager = DefaultTokenManager();

    if (isKakaoInstalled) {
      authCode = await AuthCodeClient.instance.requestWithTalk();
    } else {
      authCode = await AuthCodeClient.instance.request();
      var token = await AuthApi.instance.issueAccessToken(authCode);
      tokenManager.setToken(token);
      print(token);
    }

    print(authCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  LogoGraphicHeader(),
                  SizedBox(height: 48.0),
                  FormInputFieldWithIcon(
                    controller: authController.emailController,
                    iconPrefix: Icons.email,
                    labelText: 'auth.emailFormField'.tr,
                    validator: Validator().email,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => null,
                    onSaved: (value) =>
                    authController.emailController.text = value,
                  ),
                  FormVerticalSpace(),
                  FormInputFieldWithIcon(
                    controller: authController.passwordController,
                    iconPrefix: Icons.lock,
                    labelText: 'auth.passwordFormField'.tr,
                    validator: Validator().password,
                    obscureText: true,
                    onChanged: (value) => null,
                    onSaved: (value) =>
                    authController.passwordController.text = value,
                    maxLines: 1,
                  ),
                  FormVerticalSpace(),
                  PrimaryButton(
                      labelText: 'auth.signInButton'.tr,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          authController.signInWithEmailAndPassword(context);
                        }
                      }),
                  ElevatedButton(
                    onPressed: _loginButtonPressed,
                    style: ElevatedButton.styleFrom(primary: Colors.yellow),
                    child:

                    Text("카카오톡 로그인", style: TextStyle(color: Colors.black)),

                  ),
                  FormVerticalSpace(),
                  LabelButton(
                    labelText: 'auth.resetPasswordLabelButton'.tr,
                    onPressed: () => Get.to(ResetPasswordUI()),
                  ),
                  LabelButton(
                    labelText: 'auth.signUpLabelButton'.tr,
                    onPressed: () => Get.to(SignUpUI()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
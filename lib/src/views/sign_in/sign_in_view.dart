// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:calories_counter/src/global/constants/widgets/loading_widget.dart';
import 'package:calories_counter/src/views/bottom_navbar/bottomBar_view.dart';
import 'package:calories_counter/src/views/sign_in/sign_in_viewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, model, _) => Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/signIn/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage("assets/images/signIn/background2.png"),
                  // fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Transform.translate(
                    offset: Offset(
                      MediaQuery.of(context).size.width * 0.05,
                      MediaQuery.of(context).size.height * 0.15,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Hey, there!\nLets Get Started",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.getFont(
                          'Lato',
                          color: const Color.fromARGB(255, 39, 45, 47),
                          fontWeight: FontWeight.w400,
                          fontSize: 44,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                      MediaQuery.of(context).size.width * 0.05,
                      MediaQuery.of(context).size.height * 0.15,
                    ),
                    child: const Text(
                      "Sign up and let us make your life easy for you.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 39, 45, 47),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 0.256,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 80, 30, 30),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: model.facebookSignIn ||
                                  model.googleSignIn ||
                                  model.appaleSignIn
                              ? () {}
                              : () async {
                                  await model.loginWithFacebook();
                                },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (model.facebookSignIn)
                                  const LoadingWidget()
                                else
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/signIn/facebook.png",
                                        height: 25,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                const Text(
                                  "Sign in with Facebook",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: model.googleSignIn ||
                                  model.facebookSignIn ||
                                  model.appaleSignIn
                              ? () {}
                              : () async {
                                  await model.loginWithGoogle(context);
                                },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                if (model.googleSignIn)
                                  const LoadingWidget()
                                else
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/signIn/google.png",
                                        height: 25,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        "Sign in with Google",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            255,
                                            255,
                                            255,
                                          ),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (Platform.isIOS)
                          ElevatedButton(
                            onPressed: model.appaleSignIn ||
                                    model.googleSignIn ||
                                    model.facebookSignIn
                                ? () {}
                                : () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: model.appaleSignIn
                                  ? const LoadingWidget()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/signIn/apple.png",
                                          height: 25,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "Sign in with Apple",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                              255,
                                              255,
                                              255,
                                              255,
                                            ),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 26,
                    ),
                    child: const Text(
                      "By signing up you accept the Terms of Service and Privacy Policy.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 24, 24, 24),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 0.256,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

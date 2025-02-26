import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fyp/api/django_api.dart';
import 'package:fyp/core/providers/current_user_provider.dart';
import 'package:fyp/core/widgets/bottom_nav_bar/views/bottom_nav_bar.dart';
import 'package:fyp/feature/signup/views/signup_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/preferences.dart';
import '../../../core/providers/loading_provider.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const _emailKey = GlobalObjectKey<FormState>('login_email');
  static const _passwordKey = GlobalObjectKey<FormState>('login_password');

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/guitar.jpeg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 80, top: 150),
              child: const Text(
                'Lyrics and Chords',
                style: TextStyle(
                    color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4,
                    right: 25,
                    left: 25),
                child: Column(children: [
                  Form(
                    key: _emailKey,
                    child: VxTextField(
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      fillColor: Colors.white60,
                      hint: 'Email Address',
                      borderType: VxTextFieldBorderType.roundLine,
                      validator: (v) {
                        v ??= '';
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(v)
                            ? null
                            : 'Invalid email';
                      },
                    ),
                  ),
                  const SizedBox(
                    //to create gap between emailbox and password box//
                    height: 20,
                  ),
                  Form(
                    key: _passwordKey,
                    child: VxTextField(
                      controller: passwordController,
                      isPassword: true,
                      fillColor: Colors.white60,
                      hint: 'Password',
                      borderType: VxTextFieldBorderType.roundLine,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.only(left: 150, top: 1),
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        onTap: () async => await launch(
                            'https://music-app-backend-production.up.railway.app/api=forgot_password/recover/'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(120, 0, 30, 10),
                        child: Consumer(
                          builder: (context, ref, child) => RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(),
                            ),
                            onPressed: () async {
                              if (_emailKey.currentState!.validate() &&
                                  _passwordKey.currentState!.validate()) {
                                ref.read(loadingRef.notifier).loading = true;
                                final userDetails =
                                    await DjangoApi.loginWithEmailAndPassword(
                                        emailController.text,
                                        passwordController.text);
                                ref.read(loadingRef.notifier).loading = false;
                                if (userDetails != null) {
                                  ref.read(currentUserRef.notifier).currentUser =
                                      userDetails;
                                  await Preferences.setString(
                                      'uid_key', userDetails.userName);
                                  await Preferences.setString(
                                      'email_key', userDetails.email);
                                  await Preferences.setString(
                                      'first_name_key', userDetails.firstName ?? '');
                                  await Preferences.setString(
                                      'last_name_key', userDetails.lastName ?? '');
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (_) => const BottomNavBar(),
                                    ),
                                  );
                                } else {
                                  context.showToast(msg: 'Invalid credentials');
                                }
                              }
                            },
                            padding: const EdgeInsets.all(10.0),
                            textColor: const Color(0xff4c505b),
                            child: ref.watch(loadingRef)
                                ? const CircularProgressIndicator()
                                : const Text("Login",
                                    style: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(60, 0, 30, 10),
                          child: const Text(
                            'Have no account, Sign up',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onTap: () {
                          context.push((context) => const SignupPage());
                        },
                      ),
                    ],
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

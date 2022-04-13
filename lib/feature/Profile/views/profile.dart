import 'package:flutter/material.dart';
import 'package:fyp/api/django_api.dart';
import 'package:fyp/core/extensions/context_extensions.dart';
import 'package:fyp/core/models/user/user.dart';
import 'package:fyp/core/providers/current_user_provider.dart';
import 'package:fyp/core/widgets/main_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    User? user = ref.watch(currentUserRef);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            leading: IconButton(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                icon: Image.asset(
                  'images/menu.png',
                  height: 20,
                  color: Colors.black,
                ),
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                }),
            backgroundColor: Colors.white,
            actions: const [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 150, 0),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "SanFranciscos",
                        fontSize: 20,
                        decorationColor: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        drawer: const MainDrawer(),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/img3.jpg'), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                        child: Stack(
                          children: [
                            Container(
                                padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                                margin: const EdgeInsets.fromLTRB(25, 50, 10, 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(.1),
                                          blurRadius: 5,
                                          spreadRadius: 2)
                                    ]),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      /// card header
                                      Container(
                                          padding:
                                              const EdgeInsets.fromLTRB(0, 50, 0, 0),
                                          width: 50,
                                          child: Row(children: const [
                                            Spacer(flex: 10),
                                            Spacer(flex: 1)
                                          ])),
                                      const SizedBox(height: 50),

                                      Container(
                                          padding: const EdgeInsets.only(
                                              top: 50, left: 50),
                                          child: Row(children: [
                                            Image.asset('images/user.png',
                                                color: Colors.black, height: 20),
                                            const SizedBox(width: 30),
                                            Text(user?.userName ?? '',
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                ))
                                          ])),

                                      Container(
                                          padding: const EdgeInsets.only(
                                              top: 30, left: 50),
                                          child: Row(children: [
                                            Image.asset('images/user.png',
                                                color: Colors.black, height: 20),
                                            const SizedBox(width: 30),
                                            Text(user?.userName ?? '',
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                ))
                                          ])),
                                      Container(
                                          padding: const EdgeInsets.only(
                                              top: 30, left: 50, bottom: 50),
                                          child: Row(children: [
                                            const Icon(
                                              Icons.email,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 30),
                                            Text(user?.email ?? '',
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                ))
                                          ])),

                                      /// description
                                    ])),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(left: 25),
                                    child: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 100,
                                        backgroundImage:
                                            AssetImage('images/user.png'))))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(80, 20, 10, 5),
                        child: FlatButton(
                          minWidth: 150,
                          height: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70)),
                          color: Colors.black,
                          onPressed: () {
                            showAlertDialog(context);
                          },
                          child: const Text(
                            "LogOut",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: const Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = FlatButton(
        child: const Text("Continue"),
        onPressed: () async {
          await DjangoApi.signout();
          context.read(currentUserRef.notifier).removeCurrentUser();
        });

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("AlertDialog"),
      content: const Text("Are you sure you want to logout "),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

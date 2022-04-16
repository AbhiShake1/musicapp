import 'package:flutter/material.dart';
import 'package:fyp/core/extensions/context_extensions.dart';
import 'package:fyp/core/preferences.dart';
import 'package:fyp/feature/Notification/views/notification.dart';
import 'package:fyp/feature/Profile/views/profile.dart';
import 'package:fyp/feature/aboutus/view/aboutus.dart';
import 'package:fyp/feature/feedback/views/feedback.dart';
import 'package:fyp/feature/home/views/home.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../api/django_api.dart';
import '../../feature/login/views/login.dart';
import '../providers/current_user_provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 20, 0),
      child: Column(children: <Widget>[
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        ),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          title: const Text(
            'Home',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          hoverColor: const Color.fromRGBO(194, 236, 255, 1),
          leading: Image.asset(
            'images/home.png',
            color: Colors.black,
            height: 30,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          title: const Text(
            'Notification',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          hoverColor: const Color.fromRGBO(194, 236, 255, 1),
          leading: Image.asset(
            'images/notification.png',
            color: Colors.black,
            height: 30,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Notify()));
          },
        ),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          title: const Text(
            'Feedback',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          hoverColor: const Color.fromRGBO(194, 236, 255, 1),
          leading: Image.asset(
            'images/feedback.png',
            height: 30,
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FeedbackPage()));
          },
        ),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          title: const Text(
            'Profile',
            style: TextStyle(fontSize: 20),
          ),
          hoverColor: const Color.fromRGBO(194, 236, 255, 1),
          leading: Image.asset(
            'images/user.png',
            color: Colors.black,
            height: 30,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()));
          },
        ),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          title: const Text(
            'About us',
            style: TextStyle(fontSize: 20),
          ),
          hoverColor: const Color.fromRGBO(194, 236, 255, 1),
          leading: Image.asset(
            'images/information-button.png',
            color: Colors.black,
            height: 30,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Contact()),
            );
          },
        ),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
          title: const Text(
            'log Out',
            style: TextStyle(fontSize: 20),
          ),
          hoverColor: const Color.fromRGBO(194, 236, 255, 1),
          leading: Image.asset(
            'images/logout.png',
            color: Colors.black,
            height: 30,
          ),
          onTap: () {
            showAlertDialog(context);
          },
        ),
      ]),
    ));
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: const Text("Cancel"),
      onPressed: context.pop,
    );
    Widget continueButton = FlatButton(
        child: const Text("Continue"),
        onPressed: () async {
          context.read(currentUserRef.notifier).removeCurrentUser();
          context.pushReplacement(const LoginPage());
          await DjangoApi.signout();
          await Preferences.clear();
        });

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("AlertDialog"),
      content: const Text("Are you sure you want to logout?"),
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

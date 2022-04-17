import 'package:flutter/material.dart';
import 'package:fyp/core/widgets/main_drawer.dart';
import 'package:fyp/feature/artist/addpage.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class EXO extends StatefulWidget {
  const EXO({Key? key}) : super(key: key);

  @override
  EXOState createState() => EXOState();
}

class EXOState extends State<EXO> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            actions: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 40, 0),
                child: Text("Lyrics and chords",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Addpdf()),
                      );
                    },
                    child: const Text("+",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                  )),
            ],
          ),
        ),
        drawer: const MainDrawer(),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                ListTile(
                  leading: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        width: 300,
                        height: 500,
                        padding: const EdgeInsets.symmetric(vertical: 1.0),
                        alignment: Alignment.center,
                        child: SfPdfViewer.asset(
                          'assets/pdf/exo1.pdf',
                        ),
                      )),
                  title: const Text(
                    'Call me baby',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                ListTile(
                  leading: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {},
                      child: Container(
                        width: 300,
                        height: 500,
                        padding: const EdgeInsets.symmetric(vertical: 1.0),
                        alignment: Alignment.center,
                        child: SfPdfViewer.asset(
                          'assets/pdf/exo2.pdf',
                        ),
                      )),
                  onTap: () async {},
                  title: const Text(
                    'Monster',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ],
            ),
          )
        ])));
  }
}

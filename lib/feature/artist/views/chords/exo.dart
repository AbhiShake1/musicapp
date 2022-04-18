import 'package:flutter/material.dart';
import 'package:fyp/core/widgets/main_drawer.dart';
import 'package:fyp/feature/artist/addpage.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:velocity_x/velocity_x.dart';

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
                  leading: Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    alignment: Alignment.center,
                  ),
                  onTap: () => context.push(
                      (context) => const PdfView(pdfPath: 'assets/pdf/exo1.pdf')),
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
                  leading: Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    alignment: Alignment.center,
                  ),
                  onTap: () => context.push(
                      (context) => const PdfView(pdfPath: 'assets/pdf/exo2.pdf')),
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

class PdfView extends StatelessWidget {
  const PdfView({Key? key, required this.pdfPath}) : super(key: key);

  final String pdfPath;

  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.asset(
      pdfPath,
    );
  }
}

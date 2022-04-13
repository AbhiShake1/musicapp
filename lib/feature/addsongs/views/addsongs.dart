import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/widgets/main_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class AddSongs extends StatefulWidget {
  const AddSongs({Key? key}) : super(key: key);

  @override
  AddSongsState createState() => AddSongsState();
}

class AddSongsState extends State<AddSongs> {
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
            actions: const <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 150, 0),
                child: Text("Add Songs",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
        ),
        drawer: const MainDrawer(),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/about4.jpg'), fit: BoxFit.cover)),
            child: Column(children: [
              Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.only(top: 100),
                        child: Column(children: [
                          const VxTextField(
                            fillColor: Colors.white,
                            hint: 'Enter Song Title',
                            borderType: VxTextFieldBorderType.roundLine,
                          ),
                          const SizedBox(height: 30),
                          const VxTextField(
                            fillColor: Colors.white,
                            hint: 'Enter Artist',
                            borderType: VxTextFieldBorderType.roundLine,
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 10, top: 30),
                              child: Row(children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      FilePicker.platform.pickFiles(
                                        type: FileType.custom,
                                        allowedExtensions: ['pdf'],
                                        dialogTitle: 'Pick a pdf with music chords',
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const Text(
                                  "Upload Your Songs",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ])),
                          Container(
                              padding: const EdgeInsets.only(left: 10, top: 30),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    RaisedButton(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: const BorderSide(),
                                      ),
                                      onPressed: () async {},
                                      padding: const EdgeInsets.all(10.0),
                                      textColor: const Color(0xff4c505b),
                                      child: const Text("Upload",
                                          style: TextStyle(fontSize: 15)),
                                    ),
                                    const SizedBox(
                                      height: 49,
                                      width: 80,
                                    ),
                                    RaisedButton(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: const BorderSide(),
                                      ),
                                      onPressed: () async {},
                                      padding: const EdgeInsets.all(10.0),
                                      textColor: const Color(0xff4c505b),
                                      child: InkWell(
                                        onTap: () => context.pop(),
                                        child: const Text(
                                          "Cancel",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ]))
                        ]))
                  ])
            ])));
  }
}

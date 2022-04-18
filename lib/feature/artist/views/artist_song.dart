import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArtistSong extends StatelessWidget {
  const ArtistSong({Key? key, required this.songDetailsList}) : super(key: key);

  final List<dynamic> songDetailsList;

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
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
              padding: EdgeInsets.fromLTRB(0, 30, 80, 0),
              child: Text("Lyrics and chords",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
      body: ListView(
        children: List.generate(
            songDetailsList.length,
            (index) => Column(
                  children: [
                    ListTile(
                      leading: Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.symmetric(vertical: 1.0),
                          alignment: Alignment.center,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'images/exo.jpg',
                                ),
                              ),
                            ),
                          )),
                      onTap: () async {
                        await launch(songDetailsList[index]['url']);
                      },
                      title: Text(
                        songDetailsList[index]['title'],
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ],
                )),
      ),
    );
  }
}

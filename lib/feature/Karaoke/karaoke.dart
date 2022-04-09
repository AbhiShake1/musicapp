import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/widgets/main_drawer.dart';

class Karaoke extends StatefulWidget {
  const Karaoke({Key? key}) : super(key: key);

  @override
  _KaraokeState createState() => _KaraokeState();
}

class _KaraokeState extends State<Karaoke> {
  AudioPlayer audioPlayer = AudioPlayer();
  final AudioCache _audioCache = AudioCache(
    prefix: 'audio/',
    fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
  );
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                      'Karaoke',
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
          body: SingleChildScrollView(
              child: Column(children: [
            Container(
                padding: const EdgeInsets.fromLTRB(10, 120, 0, 0),
                child: Row(children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                      child: Image.asset(
                        'images/maya.jpeg',
                        height: 80,
                      )),
                  Container(
                      padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('Maya',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('MAYA.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Image.asset(
                      'images/batash.webp',
                      height: 80,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('Batash',
                            style: TextStyle(
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('batash.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Image.asset(
                      'images/aeDilHainMuskil.jpg',
                      height: 90,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('Ae dil hain muskil',
                            style: TextStyle(
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('ae_dil_hain_muskil.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Image.asset(
                      'images/agarTumSath.jpg',
                      height: 80,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('Agar Tum Saath Ho',
                            style: TextStyle(
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('Agar_Tum_Saath_Ho.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Image.asset(
                      'images/BlindingLights.jpg',
                      height: 80,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('Blinding Lights',
                            style: TextStyle(
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('Blinding_Lights.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Image.asset(
                      'images/chukarMereDil.jpg',
                      height: 80,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('Chukar Mere',
                            style: TextStyle(
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('chukar_mere_man_ko.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Image.asset(
                      'images/closer.jpeg',
                      height: 80,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('Closer',
                            style: TextStyle(
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('Closer.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Image.asset(
                      'images/janam.jpg',
                      height: 80,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('Janam Janam',
                            style: TextStyle(
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('Janam_Janam.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Image.asset(
                      'images/kahahola.webp',
                      height: 80,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('Kaha Hola Ghar',
                            style: TextStyle(
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('Kaha_Hola_Ghar_Bara.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Image.asset(
                      'images/lakhauHajarau.png',
                      height: 80,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('Laakhau Hajarau',
                            style: TextStyle(
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('Laakhau_Hajarau.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Image.asset(
                      'images/osanam.webp',
                      height: 80,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('O Sanam',
                            style: TextStyle(
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('O_Sanam.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Image.asset(
                      'images/perfect.jpeg',
                      height: 80,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('Perfect',
                            style: TextStyle(
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('perfect.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Image.asset(
                      'images/photograph.jpeg',
                      height: 80,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('Photograph',
                            style: TextStyle(
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('Photograph.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Image.asset(
                      'images/phulbhutte.jpeg',
                      height: 40,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('Phul Butte Sari',
                            style: TextStyle(
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('Phul_Butte_Sari.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Image.asset(
                      'images/SadhaiSadhai.jpg',
                      height: 80,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('Sadhai Sadhai',
                            style: TextStyle(
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('Sadhai_Sadhai.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Container(
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Image.asset(
                      'images/janam.jpg',
                      height: 80,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: FlatButton(
                        child: const Text('Samjhawan',
                            style: TextStyle(
                              fontFamily: "SanFranciscos",
                              fontSize: 25,
                            )),
                        onPressed: () => _audioCache.play('batash.mp3'),
                      )),
                ])),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
          ]))),
    );
  }
}

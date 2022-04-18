import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/api/django_api.dart';
import 'package:fyp/core/widgets/main_drawer.dart';
import 'package:fyp/feature/artist/views/artist_song.dart';
import 'package:fyp/feature/artist/views/chords/behemoth.dart';
import 'package:fyp/feature/artist/views/chords/bts.dart';
import 'package:fyp/feature/artist/views/chords/evanensce.dart';
import 'package:fyp/feature/artist/views/chords/exo.dart';
import 'package:fyp/feature/artist/views/chords/lambofgod.dart';
import 'package:fyp/feature/artist/views/chords/linkinpark.dart';
import 'package:fyp/feature/artist/views/chords/metallica.dart';
import 'package:fyp/feature/artist/views/chords/nepathya.dart';
import 'package:fyp/feature/artist/views/chords/pantera.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

final songsRef =
    FutureProvider.autoDispose((_) async => await DjangoApi.getAllMusic());

class Artist extends ConsumerWidget {
  const Artist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    final Map<String, dynamic> songs = ref
        .watch(songsRef)
        .maybeWhen(data: (d) => jsonDecode(d ?? '{}'), orElse: () => {});
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
                          ))),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EXO()),
                    );
                  },
                  title: const Text(
                    'EXO',
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
                                'images/metallica.webp',
                              ),
                            ),
                          ),
                        ),
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Metallica()),
                    );
                  },
                  title: const Text(
                    'Metallica',
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
                      child: Container(
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
                                  'images/behemoth.jpeg',
                                ),
                              ),
                            ),
                          ))),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Behemoth()),
                    );
                  },
                  title: const Text(
                    'Behemoth',
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Behemoth()),
                        );
                      },
                      child: Container(
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
                                'images/bts.webp',
                              ),
                            ),
                          ),
                        ),
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Bts()),
                    );
                  },
                  title: const Text(
                    'BTS',
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
                      child: Container(
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
                                  'images/evanensce.jpeg',
                                ),
                              ),
                            ),
                          ))),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Evanensce()),
                    );
                  },
                  title: const Text(
                    'Evanensce',
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LOG()),
                        );
                      },
                      child: Container(
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
                                'images/lambofgod.jpeg',
                              ),
                            ),
                          ),
                        ),
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LOG()),
                    );
                  },
                  title: const Text(
                    'Lamb Of God',
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
                      child: Container(
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
                                  'images/linkinpark.jpeg',
                                ),
                              ),
                            ),
                          ))),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => linkinpark()),
                    );
                  },
                  title: const Text(
                    'Linkin Park',
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Nepathya()),
                        );
                      },
                      child: Container(
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
                                'images/Nepathya.jpeg',
                              ),
                            ),
                          ),
                        ),
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Nepathya()),
                    );
                  },
                  title: const Text(
                    'Nepathya',
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
                    child: Container(
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
                              'images/PANTERA.webp',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pantera()),
                    );
                  },
                  title: const Text(
                    'Pantera',
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
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'images/metallica.webp',
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Metallica()),
                    );
                  },
                  title: const Text(
                    'Metallica',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                for (final entry in songs.entries)
                  Column(
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
                                  'images/metallica.webp',
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () async {
                          context.push(
                            (context) => ArtistSong(songDetailsList: entry.value),
                          );
                        },
                        title: Text(
                          entry.key,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                    ],
                  ),
              ],
            ),
          )
        ])));
  }
}

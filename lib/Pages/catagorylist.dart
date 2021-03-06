import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotifycode/Pages/home.dart';
import 'package:spotifycode/Pages/library.dart';
import 'package:spotifycode/Pages/musicInfo.dart';
import 'package:spotifycode/Pages/oneMusicArea.dart';
import 'package:spotifycode/Pages/setting.dart';
import 'package:spotifycode/Pages/youtubePlayer.dart';

class catagoryArea extends StatefulWidget {
  catagoryArea({Key? key}) : super(key: key);

  @override
  State<catagoryArea> createState() => _catagoryAreaState();
}

class _catagoryAreaState extends State<catagoryArea> {
  @override
  Widget build(BuildContext context) {
    return oneCatagoryArea();
  }
}

class oneCatagoryArea extends StatefulWidget {
  oneCatagoryArea({Key? key}) : super(key: key);

  @override
  State<oneCatagoryArea> createState() => _oneCatagoryAreaState();
}

class _oneCatagoryAreaState extends State<oneCatagoryArea> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: screenSize.width,
        color: Color.fromARGB(255, 1, 0, 26),
        child: Column(
          children: musicMetod(screenSize),
        ),
      ),
    );
  }

  List<Widget> musicMetod(Size screenSize) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: screenSize.width,
          height: screenSize.height * .3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage('assets/elements/categoryimage1.jpg'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.color),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Container(
        width: screenSize.width,
        height: screenSize.height * .13,
        color: Colors.transparent,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.playlist_play, color: Colors.white),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
                primary: Color.fromARGB(0, 25, 0, 255).withOpacity(0.6),
                onPrimary: Color.fromARGB(255, 120, 0, 233),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.download, color: Colors.white),
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  primary: Colors.transparent,
                  onPrimary: Colors.blue,
                  alignment: Alignment.centerRight),
            ),
          )
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          width: screenSize.width,
          height: screenSize.height * .5,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: musicdatas.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Card(
                    color: Color.fromARGB(0, 0, 0, 0).withOpacity(0.2),
                    key: UniqueKey(),
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 1),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        YoutubePlayer(musicdatas[index].url)));
                          },
                          child: Row(
                            children: [
                                  
                              Image(
                                image: AssetImage(
                                    "assets/elements/categoryimage$index.jpg"),
                                fit: BoxFit.fill,
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(width: 20),
                                
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => YoutubePlayer(
                                              musicdatas[index].url)));
                                },
                                child: Text(
                                        musicdatas[index].muzikAdi +
                                            "\n \n" +
                                            musicdatas[index].sarkiciIsmi,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                              ),
                            ],
                          ),
                        )),
                  ),
                );
              }),
        ),
      ),
    ];
  }
}


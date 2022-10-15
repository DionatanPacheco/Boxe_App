import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../home/home_Page.dart';
import 'neu_song.dart';

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  late AudioPlayer advancedplayer;
  @override
  void initState() {
    super.initState();
    advancedplayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            //back button and menu button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 60,
                    width: 60,
                    child: NeuSong(
                      child: AppBar(
                        backgroundColor: Colors.grey,
                        elevation: 0.0,
                        leading: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) => Colors.transparent)),
                        ),
                      ),
                    )),
                const Text(
                  'P L A Y L I S T',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 25),
                ),
                SizedBox(
                    height: 60,
                    width: 60,
                    child: NeuSong(
                      child: AppBar(
                        actions: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.menu))
                        ],
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            //cover art, artist name, song name
            NeuSong(
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/boxe.png',
                        fit: BoxFit.cover,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Text('Musica',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              )),
                          Text('Album',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ))
                        ],
                      ),
                      const Icon(Icons.favorite)
                    ],
                  ),
                ],
              ),
            ),
            //start time, shuffle button, repeat button, end time
            const SizedBox(
              height: 25,
            ),
            Row(
              children: const [
                Text('0:00'),
                Icon(Icons.shuffle),
                Icon(Icons.repeat),
                Text('4:22')
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            //linear bar
            NeuSong(
                child: LinearPercentIndicator(
              lineHeight: 10,
              percent: 0.5,
              animation: true,
              progressColor: Colors.green,
            )),
            const SizedBox(
              height: 25,
            ),
            //previous song, pause play, skip next song
            SizedBox(
              height: 80,
              child: Row(
                children: const [
                  Expanded(
                    child: NeuSong(
                      child: Icon(
                        Icons.skip_previous,
                        size: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: NeuSong(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: NeuSong(
                      child: Icon(Icons.skip_next, size: 30),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

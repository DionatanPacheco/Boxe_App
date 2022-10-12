import 'package:boxe_app/helpers/CustomColors.dart';
import 'package:boxe_app/page/loguin/loguin_Page.dart';
import 'package:boxe_app/page/music_player/song_page.dart';
import 'package:boxe_app/page/timer/timer.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountEmail: Text('dionatan.spacheco@gmail.com'),
              accountName: Text('Dionatan Pacheco'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('D.S.P'),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 5, 5, 5),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: CustonColors().getAppBarMainColor(),
              ),
              title: const Text(
                'Configurações',
                style: TextStyle(color: Color.fromARGB(221, 8, 8, 8)),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.music_note,
                color: CustonColors().getAppBarMainColor(),
              ),
              title: const Text(
                'Player',
                style: TextStyle(color: Color.fromARGB(221, 8, 8, 8)),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SongPage()));
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: CustonColors().getAppBarMainColor(),
              ),
              title: const Text(
                'Timer',
                style: TextStyle(color: Color.fromARGB(221, 8, 8, 8)),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TimerPage()));
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: CustonColors().getAppBarMainColor(),
              ),
              title: const Text(
                'Item 4',
                style: TextStyle(color: Color.fromARGB(221, 8, 8, 8)),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.arrow_back,
                color: CustonColors().getAppBarMainColor(),
              ),
              title: const Text(
                'Sair',
                style: TextStyle(color: Color.fromARGB(221, 8, 8, 8)),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoguinPage()));
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      );
}

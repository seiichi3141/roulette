import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roulette/item_list.dart';
import 'package:roulette/roulette.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roulette',
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: const [
            Expanded(child: Roulette()),
            SizedBox(width: 200, child: ItemList()),
          ],
        ),
      ),
    );
  }
}

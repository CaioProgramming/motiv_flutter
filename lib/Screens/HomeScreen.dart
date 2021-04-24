import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motiv_flutter/components/QuoteStream.dart';
import 'package:motiv_flutter/provider/HomeProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Motiv',
          style: GoogleFonts.josefinSans(
              fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_box_rounded)),
          CupertinoButton(
            onPressed: () {},
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://i.ibb.co/kD7z3Gy/3-14.jpg'),
            ),
          )
        ],
      ),
      body: ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade50,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                      hintText: "Buscar frases",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).dividerColor),
                          borderRadius: BorderRadius.circular(5))),
                ),
                Center(
                  child: CupertinoButton(
                    padding: EdgeInsets.all(16),
                    onPressed: () {},
                    child: Text('Baixe o app na Google Play!'),
                  ),
                ),
                QuoteStream()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

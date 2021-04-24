import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motiv_flutter/beans/Quote.dart';
import 'package:motiv_flutter/components/QuoteCard.dart';
import 'package:motiv_flutter/provider/HomeProvider.dart';
import 'package:provider/provider.dart';

class QuoteStream extends StatefulWidget {
  const QuoteStream();

  @override
  _QuoteStreamState createState() => _QuoteStreamState();
}

class _QuoteStreamState extends State<QuoteStream> {
  HomeProvider getProvider() =>
      Provider.of<HomeProvider>(context, listen: false);

  @override
  void initState() {
    super.initState();
    getProvider().getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = getProvider();
    double width = MediaQuery.of(context).size.width;
    int widthCard = 400;

    int countRow = width ~/ widthCard;
    if (getProvider().dataList == null) {
      return CupertinoActivityIndicator();
    } else {
      return StreamBuilder<QuerySnapshot>(
        stream: provider.dataList,
        builder: (context, snapshot) {
          final quotes = snapshot.data.docs;
          if (snapshot.data.docs == null) {
            return CupertinoActivityIndicator();
          }
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: quotes.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> documentMap = quotes[index].data();
                    print("mapped snapshot ->  $documentMap");
                    Quote quote =
                        Quote().fromMap(documentMap, quotes[index].id);
                    return QuoteCard(quote);
                  }),
            ),
          );
        },
      );
    }
  }
}

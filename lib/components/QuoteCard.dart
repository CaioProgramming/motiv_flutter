import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:motiv_flutter/beans/Quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;

  const QuoteCard(this.quote);

  void getStyle(String styleID) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://media.giphy.com/media/RJy4FQlLbxDz4kJ6GF/giphy.gif')),
            borderRadius: BorderRadius.circular(0),
            border:
                Border.all(color: Theme.of(context).textTheme.headline5.color)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.maxFinite,
              color: Theme.of(context).textTheme.headline5.color,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        height: 12,
                        width: 12,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        height: 12,
                        width: 12,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      quote.quote,
                      style: TextStyle(fontSize: 36, color: Colors.white),
                      textAlign: TextAlign.center,
                      minFontSize: 20,
                      maxFontSize: 40,
                      maxLines: 5,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      quote.author,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      minFontSize: 14,
                      maxFontSize: 20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

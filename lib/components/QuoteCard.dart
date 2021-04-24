import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motiv_flutter/beans/Quote.dart';
import 'package:motiv_flutter/beans/Style.dart';
import 'package:motiv_flutter/presenter/StylePresenter.dart';
import 'package:tinycolor/tinycolor.dart';

class QuoteCard extends StatefulWidget {
  final Quote quote;

  const QuoteCard(this.quote);

  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  Style style = Style.defaultStyle();
  @override
  void initState() {
    super.initState();
    getStyle();
  }

  void getStyle() async {
    Quote quote = widget.quote;
    print('getting style');
    StylePresenter().getStyleFromQuote(quote.style, (quoteStyle) {
      updateStyle(quoteStyle);
    });
  }

  void updateStyle(Style newStyle) {
    setState(() {
      style = newStyle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        width: 500,
        height: 500,
        decoration: BoxDecoration(
            color: Colors.purple.shade200,
            borderRadius: BorderRadius.circular(5),
            border:
                Border.all(color: Theme.of(context).textTheme.headline5.color)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              style.backgroundUrl,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.40),
              colorBlendMode: BlendMode.darken,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return Center(
                    child: CupertinoActivityIndicator(
                      animating: true,
                    ),
                  );
                } else
                  return child;
              },
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
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
                        padding: const EdgeInsets.all(16),
                        child: AutoSizeText(
                          widget.quote.quote,
                          style: TextStyle(
                              fontSize: 36,
                              color:
                                  TinyColor.fromString(style.textColor).color),
                          textAlign: TextAlign.center,
                          minFontSize: 12,
                          maxFontSize: 36,
                          maxLines: 5,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: AutoSizeText(
                          widget.quote.author,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color:
                                  TinyColor.fromString(style.textColor).color),
                          minFontSize: 12,
                          maxFontSize: 16,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

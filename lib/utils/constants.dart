import 'package:motiv_flutter/beans/Style.dart';

final String kDefaultBackground =
    'https://media.giphy.com/media/PnIpBoEJl7aaoBDxHt/giphy.gif';
final String kDefaultTextColor = '#ffffff';

final Style kDefaultStyle = Style(
    font: 3,
    textColor: kDefaultTextColor,
    backgroundUrl: kDefaultBackground,
    shadowStyle: ShadowStyle(radius: 0, dx: 0, dy: 0, shadowColor: "#000"));

import 'package:motiv_flutter/beans/BaseBean.dart';

class Style extends BaseBean {
  String backgroundUrl, textColor;
  int font;
  ShadowStyle shadowStyle;

  Style fromMap(Map<String, dynamic> map, String key) {
    return new Style(
      id: key,
      backgroundUrl: map['backgroundURL'] as String,
      textColor: map['textColor'] as String,
      font: map['font'] as int,
      shadowStyle: ShadowStyle.fromMap(map['shadowStyle']),
    );
  }

  factory Style.defaultStyle() {
    return Style(
        font: 3,
        textColor: "#ffffff",
        backgroundUrl:
            "https://media.giphy.com/media/PnIpBoEJl7aaoBDxHt/giphy.gif");
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'backgroundUrl': this.backgroundUrl,
      'textColor': this.textColor,
      'font': this.font,
      'shadowStyle': this.shadowStyle,
    } as Map<String, dynamic>;
  }

  Style(
      {String id,
      this.backgroundUrl,
      this.textColor,
      this.font,
      this.shadowStyle})
      : super(id);
}

class ShadowStyle {
  double radius, dx, dy;
  String shadowColor;

  ShadowStyle({this.radius, this.dx, this.dy, this.shadowColor});

  factory ShadowStyle.fromMap(Map<String, dynamic> map) {
    return new ShadowStyle(
      radius: map['radius'] as double,
      dx: map['dx'] as double,
      dy: map['dy'] as double,
      shadowColor: map['shadowColor'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'radius': this.radius,
      'dx': this.dx,
      'dy': this.dy,
      'shadowColor': this.shadowColor,
    } as Map<String, dynamic>;
  }
}

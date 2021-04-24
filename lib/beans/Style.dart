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
      shadowStyle:
          ShadowStyle.fromMap(map['shadowStyle'] as Map<String, dynamic>),
    );
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
  double radius, dx, dy = 0;
  String shadowColor = '#0000';

  ShadowStyle({this.radius, this.dx, this.dy, this.shadowColor});

  factory ShadowStyle.fromMap(Map<String, dynamic> map) {
    double radius = map['radius'] as double;
    double dx = map['dx'] as double;
    double dy = map['dy'] as double;
    String shadowColor = map['shadowColor'] as String;

    return new ShadowStyle(
        radius: radius != null ? radius : 0,
        dx: dx != null ? dx : 0,
        dy: dy != null ? dy : 0,
        shadowColor: shadowColor != null ? shadowColor : '#0000');
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

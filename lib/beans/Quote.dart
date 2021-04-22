import 'package:motiv_flutter/beans/BaseBean.dart';

class Quote extends BaseBean {
  String quote, author, id, style, userID;
  DateTime date;
  bool favorite, reported;
  List<String> likes;

  Quote(
      {this.quote,
      this.author,
      this.id,
      this.style,
      this.userID,
      this.date,
      this.favorite,
      this.reported,
      this.likes})
      : super(id);

  Quote fromMap(Map<String, dynamic> map) {
    return new Quote(
      quote: map['quote'] as String,
      author: map['author'] as String,
      id: map['id'] as String,
      style: map['style'] as String,
      userID: map['userID'] as String,
      date: map['date'] as DateTime,
      favorite: map['favorite'] as bool,
      reported: map['reported'] as bool,
      likes: map['likes'] as List<String>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'quote': this.quote,
      'author': this.author,
      'id': this.id,
      'style': this.style,
      'userID': this.userID,
      'date': this.date,
      'favorite': this.favorite,
      'reported': this.reported,
      'likes': this.likes,
    } as Map<String, dynamic>;
  }
}

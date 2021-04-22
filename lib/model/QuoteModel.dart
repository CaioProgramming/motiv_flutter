import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/async.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motiv_flutter/model/BaseModel.dart';

class QuoteModel extends BaseModel {
  @override
  CollectionReference collectionReference() {
    // TODO: implement collectionReference
    throw UnimplementedError();
  }

  @override
  Widget defaultBuilder(BuildContext context, snapshot) {
    // TODO: implement defaultBuilder
    throw UnimplementedError();
  }

  @override
  StreamBuilder<QuerySnapshot> defaultStreamBuilder({Stream<dynamic> stream}) {
    // TODO: implement defaultStreamBuilder
    throw UnimplementedError();
  }

  @override
  String path() => "Quotes";
}

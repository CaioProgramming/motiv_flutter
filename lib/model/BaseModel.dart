import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:motiv_flutter/beans/BaseBean.dart';

abstract class BaseModel<T extends BaseBean> {
  final firestoreInstance = Firestore.instance;

  String path();

  CollectionReference collectionReference() {
    return firestoreInstance.collection(path());
  }

  StreamBuilder<QuerySnapshot> defaultStreamBuilder({Stream stream});

  Widget defaultBuilder(BuildContext context, dynamic snapshot);

  Stream query({@required String field, @required String value}) =>
      collectionReference().where(field, isEqualTo: value).snapshots();

  Future<DocumentSnapshot> singleDocument(String key) async =>
      await collectionReference().document(key).get();

  Stream defaultStream() {
    return collectionReference().snapshots();
  }

  Future<DocumentReference> saveData(Map<String, dynamic> map) async =>
      await firestoreInstance.collection(path()).add(map);

  void editData(String key, Map<String, dynamic> map) async =>
      await firestoreInstance.collection(path()).document(key).updateData(map);

  void deleteData(String key) async =>
      await firestoreInstance.collection(path()).document(key).delete();

  Map<dynamic, dynamic> getSnapshotMap(
      List<DocumentSnapshot> documents, int index) {
    return documents[index].data;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motiv_flutter/beans/BaseBean.dart';
import 'package:motiv_flutter/presenter/BasePresenter.dart';

abstract class BaseModel<T extends BaseBean> {
  final BasePresenter presenter;

  BaseModel(this.presenter);

  final firestoreInstance = Firestore.instance;

  String path();

  T mapToBean(Map<String, dynamic> map, String key);

  Stream<QuerySnapshot> getAllData() {
    String location = path();
    print('collecting data on $location ...');
    return collectionReference().snapshots();
  }

  void queryData(String field, String value) {
    Stream queryStream =
        collectionReference().where(field, isEqualTo: value).snapshots();
    presenter.showData(queryStream);
  }

  CollectionReference collectionReference() {
    return firestoreInstance.collection(path());
  }

  void getSingleDocument(String key) async {
    DocumentSnapshot documentSnapshot =
        await collectionReference().document(key).get();

    presenter.showSingleData(
        mapToBean(documentSnapshot.data, documentSnapshot.documentID));
  }

  void getSingleDocumentObject(String key, Function(T) onObjectComplete) {
    print('querying $key on ${path()}');
    collectionReference().document(key).get().then((snapshot) {
      print('returning ${snapshot.data} from ${path()}');
      return onObjectComplete(mapToBean(snapshot.data, snapshot.documentID));
    });
  }

  Future<DocumentReference> saveData(Map<String, dynamic> map) async =>
      await firestoreInstance.collection(path()).add(map);

  void editData(String key, Map<String, dynamic> map) async =>
      await firestoreInstance.collection(path()).document(key).updateData(map);

  void deleteData(String key) async =>
      await firestoreInstance.collection(path()).document(key).delete();
}

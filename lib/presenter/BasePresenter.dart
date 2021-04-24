import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motiv_flutter/beans/BaseBean.dart';
import 'package:motiv_flutter/model/BaseModel.dart';
import 'package:motiv_flutter/provider/BaseProvider.dart';

abstract class BasePresenter<T extends BaseBean> {
  BaseModel model();
  final BaseProvider provider;

  BasePresenter({this.provider});

  void showData(Stream dataStream) async {
    int count = await dataStream.length;
    print('data collected($count...)');

    provider.setDataList(dataStream);
  }

  void showSingleData(T data) {
    print('single data obtained $T');
    provider.setSingleData(data);
  }

  void loadData() {
    print('loading data...');
    Stream<QuerySnapshot> dataStream = model().getAllData();
    provider.setDataList(dataStream);
  }

  void findSingleData(String key) {
    model().getSingleDocument(key);
  }

  void deleteData(String key) {
    model().deleteData(key);
  }

  void editData(T data) {
    model().editData(data.id, data.toMap());
  }
}

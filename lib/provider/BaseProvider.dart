import 'package:flutter/cupertino.dart';
import 'package:motiv_flutter/beans/BaseBean.dart';
import 'package:motiv_flutter/beans/Style.dart';
import 'package:motiv_flutter/presenter/BasePresenter.dart';

abstract class BaseProvider<T extends BaseBean> extends ChangeNotifier {
  BasePresenter presenter();
  Stream dataList;
  Style singleData;

  setDataList(Stream data) {
    dataList = data;
    notifyListeners();
  }

  setSingleData(T) {
    singleData = T;
    print('new single data $T');
    notifyListeners();
  }
}

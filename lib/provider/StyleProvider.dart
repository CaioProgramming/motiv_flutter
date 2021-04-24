import 'package:motiv_flutter/beans/BaseBean.dart';
import 'package:motiv_flutter/presenter/BasePresenter.dart';
import 'package:motiv_flutter/presenter/StylePresenter.dart';
import 'package:motiv_flutter/provider/BaseProvider.dart';

class StyleProvider extends BaseProvider {
  @override
  BasePresenter<BaseBean> presenter() => StylePresenter(provider: this);

  void getStyle(String id) {
    print('querying style $id');
    presenter().findSingleData(id);
  }
}

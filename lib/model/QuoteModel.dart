import 'package:motiv_flutter/beans/BaseBean.dart';
import 'package:motiv_flutter/beans/Quote.dart';
import 'package:motiv_flutter/model/BaseModel.dart';
import 'package:motiv_flutter/presenter/BasePresenter.dart';

class QuoteModel extends BaseModel<Quote> {
  QuoteModel(BasePresenter<BaseBean> presenter) : super(presenter);

  @override
  String path() => "Quotes";

  @override
  Quote mapToBean(Map<String, dynamic> map, String key) {
    return Quote().fromMap(map, key);
  }
}

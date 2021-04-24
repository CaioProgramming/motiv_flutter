import 'package:motiv_flutter/beans/BaseBean.dart';
import 'package:motiv_flutter/beans/Quote.dart';
import 'package:motiv_flutter/model/BaseModel.dart';
import 'package:motiv_flutter/model/QuoteModel.dart';
import 'package:motiv_flutter/presenter/BasePresenter.dart';
import 'package:motiv_flutter/provider/BaseProvider.dart';

class QuotePresenter extends BasePresenter {
  QuotePresenter(BaseProvider<BaseBean> notifier) : super(provider: notifier);

  @override
  BaseModel<Quote> model() => QuoteModel(this);
}

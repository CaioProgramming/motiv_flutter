import 'package:motiv_flutter/beans/BaseBean.dart';
import 'package:motiv_flutter/beans/Style.dart';
import 'package:motiv_flutter/model/StyleModel.dart';
import 'package:motiv_flutter/presenter/BasePresenter.dart';
import 'package:motiv_flutter/provider/BaseProvider.dart';

class StylePresenter extends BasePresenter<Style> {
  StylePresenter({BaseProvider<BaseBean> provider}) : super(provider: provider);

  @override
  StyleModel model() => StyleModel(this);

  void getStyleFromQuote(String key, Function(Style) onStyleComplete) {
    model().getSingleDocumentObject(key, onStyleComplete);
  }
}

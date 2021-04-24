import 'package:motiv_flutter/beans/Style.dart';
import 'package:motiv_flutter/model/BaseModel.dart';
import 'package:motiv_flutter/presenter/BasePresenter.dart';

class StyleModel extends BaseModel<Style> {
  StyleModel(BasePresenter presenter) : super(presenter);

  @override
  String path() {
    return "Styles";
  }

  @override
  Style mapToBean(Map<String, dynamic> map, String key) {
    return Style().fromMap(map, key);
  }
}

import 'package:motiv_flutter/presenter/QuotePresenter.dart';
import 'package:motiv_flutter/provider/BaseProvider.dart';

class HomeProvider extends BaseProvider {
  presenter() => QuotePresenter(this);

  void getQuotes() {
    presenter().loadData();
    notifyListeners();
  }
}


import 'package:mobx/mobx.dart';

part 'common_store.g.dart';

class CommonStore = _CommonStore with _$CommonStore;

abstract class _CommonStore with Store {
  @observable
  ObservableList<String> observableList = ObservableList<String>();


  @observable
  Future addToList(String text) async {
    observableList.add(text);
  }

  @observable
  String currentLocal = 'en';

  @action
  void changeLocal(String _locale) {
    currentLocal = _locale;
  }

  @observable
  List


}
import 'package:mobx/mobx.dart';

part 'nav_state_store.g.dart';

class NavStateStore = _NavStateStore with _$NavStateStore;

abstract class _NavStateStore with Store {
  @observable
  int selectedCountryIndex = 0;

  @action
  void onCountryTapped(int index) {
    selectedCountryIndex = index;
  }
}

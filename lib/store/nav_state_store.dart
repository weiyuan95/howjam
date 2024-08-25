import 'dart:convert';

import 'package:howjam/enums/country.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/settings.dart';

part 'nav_state_store.g.dart';

class NavStateStore = _NavStateStore with _$NavStateStore;

abstract class _NavStateStore with Store {
  // 0: To MY
  // 1: To SG
  @observable
  int selectedCountryIndex = 0;

  // Sets the initial state based on the saved settings
  @action
  Future<void> initSettings() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String settingString = preferences.getString('settings') ?? '';

    Map<String, dynamic> settingsMap = jsonDecode(settingString);
    SettingModel setting = SettingModel.fromJson(settingsMap);

    selectedCountryIndex = setting.toCountry == Country.malaysia ? 0 : 1;
  }

  @action
  void onCountryTapped(int index) {
    selectedCountryIndex = index;
  }
}

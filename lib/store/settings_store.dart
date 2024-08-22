import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:howjam/enums/checkpoint.dart';
import 'package:howjam/enums/vehicle_type.dart';
import 'package:howjam/enums/country.dart';
import 'package:howjam/models/settings.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  _SettingsStore() {
    initSettings();
  }

  /// Observables
  @observable
  String fromPostalCode = '142032';

  @observable
  Country toCountry = Country.malaysia;

  @observable
  Checkpoint toCheckpoint = Checkpoint.woodlands;

  @observable
  VehicleType vehicleType = VehicleType.car;

  @observable
  bool isDarkMode = false;

  /// Actions
  @action
  Future<void> initSettings() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String settingString = preferences.getString('settings') ?? '';

    Map<String, dynamic> settingsMap = jsonDecode(settingString);
    SettingModel setting = SettingModel.fromJson(settingsMap);

    // init settings store observables with the values from shared preferences
    fromPostalCode = setting.fromPostalCode;
    toCountry = setting.toCountry;
    toCheckpoint = setting.toCheckpoint;
    vehicleType = setting.vehicleType;
    isDarkMode = setting.isDarkMode;

    toggleDarkMode();
  }

  @action
  void persistSettings(SettingModel settingModel) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    print(settingModel.toJson());
    await preferences.setString('settings', jsonEncode(settingModel.toJson()));
  }

  @action
  void setFromPostalCode(String newPostalCode) {
    fromPostalCode = newPostalCode;
    final settingModel = SettingModel(
      fromPostalCode: newPostalCode,
      toCountry: toCountry,
      toCheckpoint: toCheckpoint,
      vehicleType: vehicleType,
      isDarkMode: isDarkMode,
    );

    persistSettings(settingModel);
  }

  @action
  void setToCountry(Country newToCountry) {
    toCountry = newToCountry;
  }

  @action
  void setToCheckpoint(Checkpoint newToCheckpoint) {
    toCheckpoint = newToCheckpoint;
  }

  @action
  void setVehicleType(VehicleType newVehicleType) {
    vehicleType = newVehicleType;
  }

  @action
  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
  }
}

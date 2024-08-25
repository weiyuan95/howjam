import 'dart:convert';

import 'package:howjam/enums/checkpoint.dart';
import 'package:howjam/enums/country.dart';
import 'package:howjam/enums/vehicle_type.dart';
import 'package:howjam/models/settings.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
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
  }

  @action
  void persistSettings(SettingModel settingModel) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('settings', jsonEncode(settingModel.toJson()));
  }

  @action
  void setFromPostalCode(String newPostalCode) {
    fromPostalCode = newPostalCode;

    persistSettings(SettingModel(
      fromPostalCode: newPostalCode,
      toCountry: toCountry,
      toCheckpoint: toCheckpoint,
      vehicleType: vehicleType,
      isDarkMode: isDarkMode,
    ));
  }

  @action
  void setToCountry(Country newToCountry) {
    toCountry = newToCountry;

    persistSettings(SettingModel(
      fromPostalCode: fromPostalCode,
      toCountry: newToCountry,
      toCheckpoint: toCheckpoint,
      vehicleType: vehicleType,
      isDarkMode: isDarkMode,
    ));
  }

  @action
  void setToCheckpoint(Checkpoint newToCheckpoint) {
    toCheckpoint = newToCheckpoint;

    persistSettings(SettingModel(
      fromPostalCode: fromPostalCode,
      toCountry: toCountry,
      toCheckpoint: newToCheckpoint,
      vehicleType: vehicleType,
      isDarkMode: isDarkMode,
    ));
  }

  @action
  void setVehicleType(VehicleType newVehicleType) {
    vehicleType = newVehicleType;

    persistSettings(SettingModel(
      fromPostalCode: fromPostalCode,
      toCountry: toCountry,
      toCheckpoint: toCheckpoint,
      vehicleType: newVehicleType,
      isDarkMode: isDarkMode,
    ));
  }

  @action
  void toggleDarkMode() {
    final newDarkModeFlag = !isDarkMode;

    isDarkMode = newDarkModeFlag;
    persistSettings(SettingModel(
      fromPostalCode: fromPostalCode,
      toCountry: toCountry,
      toCheckpoint: toCheckpoint,
      vehicleType: vehicleType,
      isDarkMode: newDarkModeFlag,
    ));
  }
}

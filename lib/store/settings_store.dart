import 'package:howjam/enums/checkpoint.dart';
import 'package:mobx/mobx.dart';

import 'package:howjam/enums/vehicle_type.dart';
import 'package:howjam/enums/country.dart';

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
  void setFromPostalCode(String newPostalCode) {
    fromPostalCode = newPostalCode;
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

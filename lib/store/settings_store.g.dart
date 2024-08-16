// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on _SettingsStore, Store {
  late final _$fromPostalCodeAtom =
      Atom(name: '_SettingsStore.fromPostalCode', context: context);

  @override
  String get fromPostalCode {
    _$fromPostalCodeAtom.reportRead();
    return super.fromPostalCode;
  }

  @override
  set fromPostalCode(String value) {
    _$fromPostalCodeAtom.reportWrite(value, super.fromPostalCode, () {
      super.fromPostalCode = value;
    });
  }

  late final _$toCountryAtom =
      Atom(name: '_SettingsStore.toCountry', context: context);

  @override
  Country get toCountry {
    _$toCountryAtom.reportRead();
    return super.toCountry;
  }

  @override
  set toCountry(Country value) {
    _$toCountryAtom.reportWrite(value, super.toCountry, () {
      super.toCountry = value;
    });
  }

  late final _$toCheckpointAtom =
      Atom(name: '_SettingsStore.toCheckpoint', context: context);

  @override
  Checkpoint get toCheckpoint {
    _$toCheckpointAtom.reportRead();
    return super.toCheckpoint;
  }

  @override
  set toCheckpoint(Checkpoint value) {
    _$toCheckpointAtom.reportWrite(value, super.toCheckpoint, () {
      super.toCheckpoint = value;
    });
  }

  late final _$vehicleTypeAtom =
      Atom(name: '_SettingsStore.vehicleType', context: context);

  @override
  VehicleType get vehicleType {
    _$vehicleTypeAtom.reportRead();
    return super.vehicleType;
  }

  @override
  set vehicleType(VehicleType value) {
    _$vehicleTypeAtom.reportWrite(value, super.vehicleType, () {
      super.vehicleType = value;
    });
  }

  late final _$isDarkModeAtom =
      Atom(name: '_SettingsStore.isDarkMode', context: context);

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.reportRead();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.reportWrite(value, super.isDarkMode, () {
      super.isDarkMode = value;
    });
  }

  late final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore', context: context);

  @override
  void setFromPostalCode(String newPostalCode) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.setFromPostalCode');
    try {
      return super.setFromPostalCode(newPostalCode);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setToCountry(Country newToCountry) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.setToCountry');
    try {
      return super.setToCountry(newToCountry);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setToCheckpoint(Checkpoint newToCheckpoint) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.setToCheckpoint');
    try {
      return super.setToCheckpoint(newToCheckpoint);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVehicleType(VehicleType newVehicleType) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.setVehicleType');
    try {
      return super.setVehicleType(newVehicleType);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleDarkMode() {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.toggleDarkMode');
    try {
      return super.toggleDarkMode();
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fromPostalCode: ${fromPostalCode},
toCountry: ${toCountry},
toCheckpoint: ${toCheckpoint},
vehicleType: ${vehicleType},
isDarkMode: ${isDarkMode}
    ''';
  }
}

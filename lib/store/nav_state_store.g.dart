// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_state_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavStateStore on _NavStateStore, Store {
  late final _$selectedCountryIndexAtom =
      Atom(name: '_NavStateStore.selectedCountryIndex', context: context);

  @override
  int get selectedCountryIndex {
    _$selectedCountryIndexAtom.reportRead();
    return super.selectedCountryIndex;
  }

  @override
  set selectedCountryIndex(int value) {
    _$selectedCountryIndexAtom.reportWrite(value, super.selectedCountryIndex,
        () {
      super.selectedCountryIndex = value;
    });
  }

  late final _$_NavStateStoreActionController =
      ActionController(name: '_NavStateStore', context: context);

  @override
  void onCountryTapped(int index) {
    final _$actionInfo = _$_NavStateStoreActionController.startAction(
        name: '_NavStateStore.onCountryTapped');
    try {
      return super.onCountryTapped(index);
    } finally {
      _$_NavStateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCountryIndex: ${selectedCountryIndex}
    ''';
  }
}

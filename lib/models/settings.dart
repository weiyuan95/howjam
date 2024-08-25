import 'package:howjam/enums/checkpoint.dart';
import 'package:howjam/enums/country.dart';
import 'package:howjam/enums/vehicle_type.dart';

class SettingModel {
  final String fromPostalCode;
  final Country toCountry;
  final Checkpoint toCheckpoint;
  final VehicleType vehicleType;
  final bool isDarkMode;

  const SettingModel(
      {required this.fromPostalCode,
      required this.toCountry,
      required this.toCheckpoint,
      required this.vehicleType,
      required this.isDarkMode});

  factory SettingModel.fromJson(Map<String, dynamic> parsedJson) {
    return SettingModel(
      fromPostalCode: parsedJson['fromPostalCode'],
      toCountry: parsedJson['toCountry'].toString().contains('malaysia')
          ? Country.malaysia
          : Country.singapore,
      toCheckpoint: parsedJson['toCheckpoint'].toString().contains('woodlands')
          ? Checkpoint.woodlands
          : Checkpoint.tuas,
      vehicleType: parsedJson['vehicleType'].toString().contains('car')
          ? VehicleType.car
          : VehicleType.motorcycle,
      isDarkMode: parsedJson['isDarkMode'].toString().contains('true'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fromPostalCode': fromPostalCode.toString(),
      'toCountry': toCountry.toString(),
      'toCheckpoint': toCheckpoint.toString(),
      'vehicleType': vehicleType.toString(),
      'isDarkMode': isDarkMode.toString(),
    };
  }
}

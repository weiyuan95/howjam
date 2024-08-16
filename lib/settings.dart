import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:howjam/enums/checkpoint.dart';
import 'package:howjam/enums/country.dart';
import 'package:howjam/enums/vehicle_type.dart';
import 'package:howjam/store/settings_store.dart';
import 'package:howjam/utils/string_extensions.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  SettingsState createState() => SettingsState();
}

final toCountryDropdownValues = Country.values.map((country) {
  return DropdownMenuItem(
    value: country,
    child: Text(
      // country.toString() = "Country.singapore"
      country.toString().split('.').last.capitalize(),
    ),
  );
}).toList();

final toCheckpointDropdownValues = Checkpoint.values.map((checkpoint) {
  return DropdownMenuItem(
    value: checkpoint,
    child: Text(
      // checkpoint.toString() = "Checkpoint.woodlands"
      checkpoint.toString().split('.').last.capitalize(),
    ),
  );
}).toList();

final vehicleTypeDropdownValues = VehicleType.values.map((vehicleType) {
  return DropdownMenuItem(
    value: vehicleType,
    child: Text(
      // vehicleType.toString() = "VehicleType.car"
      vehicleType.toString().split('.').last.capitalize(),
    ),
  );
}).toList();

class SettingsState extends State<Settings> {
  final _settingsFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final settingsStore = Provider.of<SettingsStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.grey,
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _settingsFormKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Observer(builder: (context) {
            return Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'From Postal Code',
                  ),
                  initialValue: settingsStore.fromPostalCode.toString(),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (newValue) {
                    if (newValue == null || newValue.isEmpty) {
                      return 'Please enter a postal code';
                    }
                    if (newValue.length < 6) {
                      return 'Postal code must be at least 6 digits';
                    }
                    if (newValue.length > 6) {
                      return 'Postal code cannot be more than 6';
                    }
                    return null;
                  },
                  onChanged: (String? newValue) {
                    // Save the postal code to settingsStore
                    settingsStore.setFromPostalCode(newValue ?? '999999');
                  },
                  onSaved: (String? newValue) {
                    settingsStore.setFromPostalCode(newValue ?? '999999');
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<Country>(
                  decoration: const InputDecoration(
                    labelText: 'To Country',
                  ),
                  value: settingsStore.toCountry,
                  items: toCountryDropdownValues,
                  onChanged: (Country? newValue) {
                    settingsStore.setToCountry(newValue!);
                  },
                  onSaved: (Country? newValue) {
                    settingsStore.setToCountry(newValue!);
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<Checkpoint>(
                  decoration: const InputDecoration(
                    labelText: 'To Checkpoint',
                  ),
                  value: settingsStore.toCheckpoint,
                  items: toCheckpointDropdownValues,
                  onChanged: (Checkpoint? newValue) {
                    settingsStore.setToCheckpoint(newValue!);
                  },
                  onSaved: (Checkpoint? newValue) {
                    settingsStore.setToCheckpoint(newValue!);
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<VehicleType>(
                  decoration: const InputDecoration(
                    labelText: 'Vehicle Type',
                  ),
                  value: settingsStore.vehicleType,
                  items: vehicleTypeDropdownValues,
                  onChanged: (VehicleType? newValue) {
                    settingsStore.setVehicleType(newValue!);
                  },
                  onSaved: (VehicleType? newValue) {
                    settingsStore.setVehicleType(newValue!);
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: _saveSettings,
                  child: const Text('Save'),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  void _saveSettings() {
    // Check if the form is valid
    if (_settingsFormKey.currentState!.validate()) {
      // Show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Settings saved!'),
        ),
      );
      Navigator.pop(context);
    }
  }
}

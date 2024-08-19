import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:howjam/checkpoint-img/accordion.dart';
import 'package:howjam/settings.dart';
import 'package:provider/provider.dart';

import 'store/nav_state_store.dart';
import 'store/settings_store.dart';

// packages to use
// https://pub.dev/packages/chaleno
// https://github.com/payam-zahedi/toastification
// https://datamall.lta.gov.sg/content/datamall/en/dynamic-data.html

// Location search: https://www.onemap.gov.sg/omapp/locationsearch?searchVal=malaysia
void main() {
  // runApp(const MaterialApp(
  //   home: App(),
  // ));
  runApp(
    MultiProvider(providers: [
      Provider<SettingsStore>(create: (_) => SettingsStore()),
      Provider<NavStateStore>(create: (_) => NavStateStore()),
    ], child: const MaterialApp(home: App())),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsStore = Provider.of<SettingsStore>(context);
    final navStateStore = Provider.of<NavStateStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("HowJam?"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(_createSettingsRoute());
            },
          ),
        ],
        backgroundColor: Colors.grey,
      ),
      bottomNavigationBar: Observer(
        builder: (_) => BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/malaysia.png',
                  width: 30, height: 30),
              label: 'To MY',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/singapore.png',
                  width: 30, height: 30),
              label: 'To SG',
            ),
          ],
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedItemColor: Colors.black,
          currentIndex: navStateStore.selectedCountryIndex,
          onTap: navStateStore.onCountryTapped,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CheckpointAccordion(),
          ],
        ),
      ),
    );
  }
}

Route _createSettingsRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Settings(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // right to left
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/settings_controller.dart';
import '../../notifiers/setting_notifier.dart';
import '../widgets/custom_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsController>(context).settings;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings page"),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text("Holat"),
            value: settings.themeMode == ThemeMode.dark,
            onChanged: (value) {
              Provider.of<SettingsController>(context, listen: false).toggleTheme(value);
            },
          ),
        ],
      ),
    );
  }
}

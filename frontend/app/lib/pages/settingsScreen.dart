import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Language:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: themeProvider.selectedLanguage,
              onChanged: (String? newValue) {
                themeProvider.setLanguage(newValue!);
              },
              items: ['English', 'Spanish', 'French']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Theme:',
              style: TextStyle(fontSize: 18),
            ),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: themeProvider.isDarkModeEnabled,
              onChanged: (value) {
                themeProvider.toggleDarkMode(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeProvider with ChangeNotifier {
  String _selectedLanguage = 'English';
  bool _isDarkModeEnabled = false;

  String get selectedLanguage => _selectedLanguage;
  bool get isDarkModeEnabled => _isDarkModeEnabled;

  void setLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  void toggleDarkMode(bool value) {
    _isDarkModeEnabled = value;
    notifyListeners();
  }
}

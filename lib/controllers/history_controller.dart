import 'package:shared_preferences/shared_preferences.dart';

class HistoryController {
  static const String _key = 'calc_history';

  // Save a new record
  Future<void> saveHistory(String calculation) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList(_key) ?? [];
    
    // Format: "Calculation | Timestamp"
    String timestamp = DateTime.now().toString().split('.')[0]; 
    history.insert(0, "$calculation | $timestamp");
    
    await prefs.setStringList(_key, history);
  }

  // Retrieve all records
  Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }
}
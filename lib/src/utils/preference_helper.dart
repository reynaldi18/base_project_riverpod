import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

class PreferenceHelper {
  final SharedPreferences preferences;

  PreferenceHelper({required this.preferences});

  String? token() {
    return preferences.getString('keyToken');
  }

  void setToken(String token) {
    preferences.setString('keyToken', token);
  }
}

final preferenceHelperProvider = Provider<PreferenceHelper>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return PreferenceHelper(preferences: sharedPrefs);
});

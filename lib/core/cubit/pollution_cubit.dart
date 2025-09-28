import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pollution_state.dart';
class PollutionCubit extends Cubit<PollutionState> {
  PollutionCubit(bool isDark, String language)
      : super(PollutionInitial(isDark: isDark, language: language));

  void toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDark", isDark);
    emit(DarkModeChangedState(isDark: isDark, language: state.language));
  }

  void changeLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("Language", lang);
    emit(ChangeLanguageState(isDark: state.isDark, language: lang));
  }
}

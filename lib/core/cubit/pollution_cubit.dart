import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pollution_state.dart';

class PollutionCubit extends Cubit<PollutionState> {
  PollutionCubit() : super(PollutionInitial());

  bool isDarkMode = false;
  String currentLanguage = "en";
  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    emit(DarkModeChangedState());
  }

  void changeLanguage(String lang) {
    currentLanguage = lang;
    emit(ChangeLanguageState());
  }
}

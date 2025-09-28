part of 'pollution_cubit.dart';

@immutable
abstract class PollutionState {
  final bool isDark;
  final String language;

  const PollutionState({required this.isDark, required this.language});
}

class PollutionInitial extends PollutionState {
  const PollutionInitial({required super.isDark, required super.language});
}

class DarkModeChangedState extends PollutionState {
  const DarkModeChangedState({required super.isDark, required super.language});
}

class ChangeLanguageState extends PollutionState {
  const ChangeLanguageState({required super.isDark, required super.language});
}

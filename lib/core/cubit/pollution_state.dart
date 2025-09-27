part of 'pollution_cubit.dart';

@immutable
abstract class PollutionState {}

class PollutionInitial extends PollutionState {}

class DarkModeChangedState extends PollutionState {}

class ChangeLanguageState extends PollutionState {}

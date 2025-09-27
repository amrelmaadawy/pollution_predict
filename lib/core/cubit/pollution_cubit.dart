import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pollution_state.dart';

class PollutionCubit extends Cubit<PollutionState> {
  PollutionCubit() : super(PollutionInitial());
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollution/core/cubit/pollution_cubit.dart';
import 'package:pollution/generated/l10n.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocBuilder<PollutionCubit, PollutionState>(
        builder: (context, state) {
          final cubit = context.read<PollutionCubit>();

          return Column(
            children: [
              Row(
                children: [
                  Text(
                    S.of(context).DarkMode,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Switch(
                    value: state.isDark,
                    onChanged: (v) async {
                    
                      cubit.toggleTheme(v);
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    S.of(context).Language,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(value: "en", label: Text("English")),
                      ButtonSegment(value: "ar", label: Text("العربية")),
                    ],
                    selected: {state.language},
                    onSelectionChanged: (newValue)async {
                      
                      cubit.changeLanguage(newValue.first);
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

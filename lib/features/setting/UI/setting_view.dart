import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollution/core/app_colors.dart';
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
                    activeThumbColor: kDarkTextGreenColor,
                    activeTrackColor: kDarkHighlightGreenColor,
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
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                        states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return state.isDark
                              ? kDarkHighlightGreenColor
                              : kLightHighlightGreenColor; // لون الاكتف
                        }
                        return Theme.of(
                          context,
                        ).colorScheme.surface; // لون العادي
                      }),
                      foregroundColor: WidgetStateProperty.resolveWith<Color?>((
                        states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return state.isDark
                              ? kDarkTextGreenColor
                              : klightGreenTextColor; // لون النص لما يكون Active
                        }
                        return Colors.grey.shade700; // لون النص العادي
                      }),
                    ),
                    segments: const [
                      ButtonSegment(value: "en", label: Text("English")),
                      ButtonSegment(value: "ar", label: Text("العربية")),
                    ],
                    selected: {state.language},
                    onSelectionChanged: (newValue) async {
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

import 'package:flutter/material.dart';
import 'package:pollution/generated/l10n.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                S.of(context).DarkMode,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Switch(value: true, onChanged: (v) {}),
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
                selected: {"en"},
                onSelectionChanged: (newValue) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

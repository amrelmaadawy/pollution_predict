import 'package:flutter/material.dart';
import 'package:pollution/features/history/ui/widgets/preditction_item.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,

            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => PredictionItem(),
              separatorBuilder: (context, index) => SizedBox(height: 5),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

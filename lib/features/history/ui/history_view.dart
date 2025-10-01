import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pollution/core/model/prediction_model.dart';
import 'package:pollution/features/history/ui/widgets/preditction_item.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<PredictionModel>('pollutionBox');
    return ValueListenableBuilder(
      
      valueListenable: box.listenable(),
      builder: (BuildContext context, value, Widget? child) {
            final predictions = box.values.toList().reversed.toList();

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: predictions.isEmpty
              ? const Center(
                  child: Text(
                    "No predictions saved yet.",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = predictions[index];
                          return PredictionItem(
                            date: item.date,
                            prediction: item.prediction,
                            pollution: Map<String, double>.from(
                              item.pollutants,
                            ),
                            index: index,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 5),
                        itemCount: predictions.length,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/features/history/ui/widgets/pollutants_levels_item.dart';

class PredictionItem extends StatelessWidget {
  const PredictionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1-2-2024', style: TextStyle(fontSize: 18)),
                  Row(
                    children: [
                      Text('Prediction:', style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 5),
                      Text(
                        'Good',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: klightGreenTextColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Pollutants: PM10:12, NO2:12, SO2:12, CO:21, O3:121',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15, color: kSubTextColor),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          kLightHighlightGreenColor,
                                      child: Icon(
                                        Icons.air,
                                        color: klightGreenTextColor,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Prediction Details',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '10-2-2024',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: kSubTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      'Overall Quality',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: kSubTextColor,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      'Good [50]',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: klightGreenTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Text(
                                  'Pollutants Levels',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                PollutantsLevelsItem(
                                  pollutant: 'PM10',
                                  value: '21',
                                ),
                                PollutantsLevelsItem(
                                  pollutant: 'Co',
                                  value: '21',
                                ),
                                PollutantsLevelsItem(
                                  pollutant: 'O3',
                                  value: '21',
                                ),
                                PollutantsLevelsItem(
                                  pollutant: 'S02',
                                  value: '21',
                                ),
                                PollutantsLevelsItem(
                                  pollutant: 'NO2',
                                  value: '21',
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          kLightHighlightGreenColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(
                                        context,
                                      ).pop(); // يقفل الكارد
                                    },
                                    child: Text(
                                      'Close',
                                      style: TextStyle(
                                        color: klightGreenTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: kLightHighlightGreenColor,
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                      color: klightGreenTextColor,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: kLightHighlightRedColor,
                  child: Icon(Icons.delete_outline, color: kRedTextColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

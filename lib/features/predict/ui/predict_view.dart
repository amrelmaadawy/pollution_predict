import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/core/model/prediction_model.dart';
import 'package:pollution/features/predict/logic/cubit/predict_cubit.dart';
import 'package:pollution/features/predict/ui/widgets/custom_text_form_field.dart';
import 'package:pollution/features/predict/ui/widgets/prediction_card.dart';
import 'package:pollution/generated/l10n.dart';

class PredictView extends StatefulWidget {
  const PredictView({super.key});

  @override
  State<PredictView> createState() => _PredictViewState();
}

class _PredictViewState extends State<PredictView> {
  TextEditingController pm10Controller = TextEditingController();
  TextEditingController no2Controller = TextEditingController();
  TextEditingController so2Controller = TextEditingController();
  TextEditingController coController = TextEditingController();
  TextEditingController o3Controller = TextEditingController();
  TextEditingController tempController = TextEditingController();
  TextEditingController humdintyController = TextEditingController();
  TextEditingController windController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(S.of(context).CleanAirPrediction, style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<PredictCubit, PredictState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).EnterAirQuailtyData,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomTextFormField(
                        controller: pm10Controller,
                        text: 'PM10 (µg/m³)',
                        labelText: 'PM10',
                        validator: (p1) {
                          if (p1!.isEmpty) {
                            return S.of(context).ThisFieldisRequired;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      CustomTextFormField(
                        controller: no2Controller,
                        text: 'NO2 (ppb)',
                        labelText: 'NO2',
                        validator: (p1) {
                          if (p1!.isEmpty) {
                            return S.of(context).ThisFieldisRequired;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      CustomTextFormField(
                        controller: so2Controller,
                        text: 'SO2 (ppb)',
                        labelText: 'SO2',
                        validator: (p1) {
                          if (p1!.isEmpty) {
                            return S.of(context).ThisFieldisRequired;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      CustomTextFormField(
                        controller: coController,
                        text: 'CO (ppm)',
                        labelText: 'CO',
                        validator: (p1) {
                          if (p1!.isEmpty) {
                            return S.of(context).ThisFieldisRequired;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      CustomTextFormField(
                        controller: o3Controller,
                        text: 'O3 (ppb)',
                        labelText: 'O3',
                        validator: (p1) {
                          if (p1!.isEmpty) {
                            return S.of(context).ThisFieldisRequired;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      CustomTextFormField(
                        controller: tempController,
                        text: '${S.of(context).Temperature} (°C)',
                        labelText: S.of(context).Temperature,
                        validator: (p1) {
                          if (p1!.isEmpty) {
                            return S.of(context).ThisFieldisRequired;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),

                      CustomTextFormField(
                        controller: windController,
                        text: '${S.of(context).Wind} (m/s)',
                        labelText: S.of(context).Wind,
                        validator: (p1) {
                          if (p1!.isEmpty) {
                            return S.of(context).ThisFieldisRequired;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      CustomTextFormField(
                        controller: humdintyController,
                        text:'${S.of(context).Humidity} (%)',
                        labelText: S.of(context).Humidity,
                        validator: (p1) {
                          if (p1!.isEmpty) {
                            return S.of(context).ThisFieldisRequired;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDark
                              ? kDarkHighlightGreenColor
                              : kLightHighlightGreenColor,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () async {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          await context
                              .read<PredictCubit>()
                              .getPrediction(
                                pm10: double.parse(pm10Controller.text),
                                no2: double.parse(no2Controller.text),
                                so2: double.parse(so2Controller.text),
                                co: double.parse(coController.text),
                                o3: double.parse(o3Controller.text),
                                temperature: double.parse(tempController.text),
                                humidity: double.parse(humdintyController.text),
                                wind: double.parse(windController.text),
                              )
                              .then((value) {
                                final box = Hive.box<PredictionModel>(
                                  'pollutionBox',
                                );
                                final prediction = double.parse(
                                  box.getAt(box.length - 1)!.prediction,
                                );
                            
                                showDialog(
                                  context: context,
                                  barrierDismissible:
                                      false, // يمنع الإغلاق بالضغط خارج الدIALOG
                                  builder: (context) {
                                    return PredictionCard(prediction: prediction);
                                  },
                                );
                              });
                        },
                        child: Text(
                          S.of(context).Predict,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? kDarkTextGreenColor
                                : klightGreenTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

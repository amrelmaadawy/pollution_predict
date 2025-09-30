import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/features/predict/logic/cubit/predict_cubit.dart';
import 'package:pollution/features/predict/ui/widgets/data_form_field.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocProvider(
          create: (context) => PredictCubit(Dio()),
          child: BlocBuilder<PredictCubit, PredictState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Enter the data'),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      controller: pm10Controller,
                      text: 'pm10',
                      labelText: 'pm10',
                      validator: (p1) {
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: no2Controller,
                      text: 'no2',
                      labelText: 'no2',
                      validator: (p1) {
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: so2Controller,
                      text: 'so2',
                      labelText: 'so2',
                      validator: (p1) {
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: coController,
                      text: 'co',
                      labelText: 'co',
                      validator: (p1) {
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: tempController,
                      text: 'temp',
                      labelText: 'temp',
                      validator: (p1) {
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: o3Controller,
                      text: 'o3',
                      labelText: 'o3',
                      validator: (p1) {
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: windController,
                      text: 'wind',
                      labelText: 'wind',
                      validator: (p1) {
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: humdintyController,
                      text: 'humdinty',
                      labelText: 'humdinty',
                      validator: (p1) {
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kDarkHighlightGreenColor,
                        minimumSize: Size(200, 40),
                      ),
                      onPressed: () async{
                       await context.read<PredictCubit>().getPrediction(
                          pm10: double.parse(pm10Controller.text),
                          no2: double.parse(pm10Controller.text),
                          so2: double.parse(pm10Controller.text),
                          co: double.parse(pm10Controller.text),
                          o3: double.parse(pm10Controller.text),
                          temperature: double.parse(pm10Controller.text),
                          humidity: double.parse(pm10Controller.text),
                          wind: double.parse(pm10Controller.text),
                        );
                      },
                      child: Text(
                        'Predict',
                        style: TextStyle(
                          fontSize: 17,
                          color: kDarkTextGreenColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollution/features/air_quality_map/UI/widgets/build_info_box.dart';
import 'package:pollution/features/predict/logic/cubit/predict_cubit.dart';
import 'package:pollution/generated/l10n.dart';

class PresentCityAQI extends StatelessWidget {
  const PresentCityAQI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: BlocBuilder<PredictCubit, PredictState>(
        builder: (context, state) {
          if (state is AQILoading) {
            return buildInfoBox(S.of(context).CalculatingAQI, Colors.blue);
          } else if (state is AQISuccess) {
            final aqi = state.aqi;
    
            Color color;
            String status;
    
            if (aqi <= 50) {
              status = S.of(context).good;
              color = Colors.green;
            } else if (aqi <= 100) {
              status = S.of(context).moderate;
              color = Colors.orange;
            } else {
              status = S.of(context).unhealthy;
              color = Colors.red;
            }
    
            return buildInfoBox(
              "${S.of(context).PredictedAQI }: ${aqi.toStringAsFixed(2)}\n${S.of(context).Status}: $status",
              color,
            );
          } else if (state is AQIFailure) {
            return buildInfoBox("${S.of(context).Error}: ${state.error}", Colors.red);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

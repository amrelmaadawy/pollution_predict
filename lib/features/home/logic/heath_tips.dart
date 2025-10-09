import 'package:flutter/material.dart';
import 'package:pollution/generated/l10n.dart';

String getHealthTip(double prediction,BuildContext context) {
  if (prediction <= 50) {
    return S.of(context).TheairqualityisgoodEnjoyyouroutdooractivities;
  } else if (prediction <= 100) {
    return S.of(context).ModerateHealthTip;
  } else if (prediction <= 150) {
    return S.of(context).UnhealthyForSensitiveGroupsHealthTip;
  } else if (prediction <= 200) {
    return S.of(context).UnhealthyHealthTip;
  } else if (prediction <= 300) {
    return S.of(context).VeryUnhealthyHealthTip;
  } else {
    return S.of(context).HazardousHealthTip;
  }
}

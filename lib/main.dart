import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pollution/core/cubit/pollution_cubit.dart';
import 'package:pollution/features/air_quality/ui/nav_bar_view.dart';
import 'package:pollution/generated/l10n.dart';

void main() {
  runApp(
    BlocProvider(create: (context) => PollutionCubit(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PollutionCubit, PollutionState>(
      builder: (context, state) {
        final cubit = context.read<PollutionCubit>();
        return MaterialApp(
          theme: cubit.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          locale: Locale(cubit.currentLanguage),
          supportedLocales: S.delegate.supportedLocales,
          home: NavBarView(),
        );
      },
    );
  }
}

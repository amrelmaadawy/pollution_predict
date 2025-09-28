import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pollution/core/cubit/pollution_cubit.dart';
import 'package:pollution/features/air_quality/ui/nav_bar_view.dart';
import 'package:pollution/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized(); 

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isDark = prefs.getBool("isDark");
  String? lang = prefs.getString("Language");
  runApp(
    BlocProvider(
      create: (context) => PollutionCubit(isDark??false,lang??'en'),
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PollutionCubit, PollutionState>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.isDark ? ThemeData.dark() : ThemeData.light(),
          locale: Locale(state.language),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          home: const NavBarView(),
        );
      },
    );
  }
}


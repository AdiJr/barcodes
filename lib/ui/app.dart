import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/bloc/theme_cubit/theme_cubit.dart';
import 'package:flutter_template/config/routes.dart';
import 'package:flutter_template/config/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (BuildContext context, ThemeState state) {
        return MaterialApp.router(
          routerConfig: Routes.router,
          title: 'Flutter Template',
          theme: AppThemes.lightTheme,
          themeMode: state.themeMode,
          darkTheme: AppThemes.darkTheme,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    );
  }
}

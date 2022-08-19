import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(ThemeState(ThemeMode.system));

  void setTheme(ThemeMode themeMode) {
    emit(ThemeState(themeMode));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return json['isDark'] as bool
        ? ThemeState(ThemeMode.dark)
        : ThemeState(ThemeMode.light);
  }

  @override
  Map<String, bool>? toJson(ThemeState state) {
    return {'isDark': state.themeMode == ThemeMode.dark};
  }
}

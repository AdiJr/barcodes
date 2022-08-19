import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/bloc/theme_cubit/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () =>
                  BlocProvider.of<ThemeCubit>(context).setTheme(ThemeMode.dark),
              child: Text('Dark Theme'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () => BlocProvider.of<ThemeCubit>(context)
                  .setTheme(ThemeMode.light),
              child: Text('Light Theme'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () => BlocProvider.of<ThemeCubit>(context)
                  .setTheme(ThemeMode.system),
              child: Text('System Theme'),
            ),
          ],
        ),
      ),
    );
  }
}

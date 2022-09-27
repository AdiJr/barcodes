import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/bloc/theme_cubit/theme_cubit.dart';
import 'package:flutter_template/data/network/rest_service.dart';
import 'package:flutter_template/data/repository/example_repository.dart';
import 'package:flutter_template/ui/app.dart';
import 'package:flutter_template/utils/constants.dart';

class GlobalProviders extends StatelessWidget {
  GlobalProviders({super.key}) {
    _restService = RestService(
      BaseOptions(
        contentType: contentTypeJson,
        receiveTimeout: defaultTimeout,
        sendTimeout: defaultTimeout,
        connectTimeout: defaultTimeout,
      ),
      restBaseUrl,
    );
  }

  late final RestService _restService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: _buildRepositories(context),
      child: MultiBlocProvider(
        providers: _buildBlocProviders(context),
        child: const App(),
      ),
    );
  }

  List<RepositoryProvider<dynamic>> _buildRepositories(BuildContext context) =>
      <RepositoryProvider<dynamic>>[
        RepositoryProvider<ExampleRepository>(
            create: (context) => ExampleRepository(_restService)),
      ];

  List<BlocProvider<dynamic>> _buildBlocProviders(BuildContext context) =>
      <BlocProvider<dynamic>>[
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
      ];
}

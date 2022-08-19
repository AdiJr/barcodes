# Flutter Template

Template for Flutter to start building apps even faster and in good style.

## Features
- Support only for Android(minSdk: API 26, target: API 33) and iOS,
- State management: BLoC,
- Dark mode support added using simple ThemeCubit,
- Networking: Retrofit, Dio,
- Custom logger for debug purposes,
- Routing system based on Navigator 2.0 - using routemaster package,
- Code analysis - very_good_analysis,
- Uses Flutter 3.0.5 - channel stable,
- Simple localization integration with easy_localization package,
- Prepared for models backed by freezed

## Used libraries
- retrofit,
- freezed,
- bloc,
- flutter_bloc,
- hydrated_bloc,
- bloc_test,
- mockito,
- routemaster,
- json_serializable,
- easy_localization,
- equatable,
- path_provider,
- google_fonts,
- very_good_analysis,
- freezed_annotation,
- json_annotation,
- build_runner,
- retrofit_generator

## File structure

1. /assets - folder for assets containing translations, images and icons directories
2. /lib/bloc - folder containing state management logic, app business logic,
3. /lib/config - folder containing custom logger, theme and routes files,
4. /lib/data/models - put here all models,
5. /lib/data/network - folder containing rest service and client used for communicating with BE services using REST API,
6. /lib/data/repository - folder containing repositories - bridge between network and logic in blocs/cubits
7. /lib/ui - put here all ui widgets,
8. /lib/utils - put here additional utils

## Data flow

This template uses repository pattern - all data are fetched by rest client which passes it to rest service which is known only to appropriate repository (recommended: use only one repository for one feature in your app) which then is called by bloc/cubit from UI.

Simple diagram:
API -> Rest Client -> Rest Service -> Repository -> Bloc/Cubit -> UI

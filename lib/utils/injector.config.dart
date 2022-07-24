// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/database/local.dart' as _i3;
import '../data/services/service.dart' as _i4;
import '../data/state/todo-state.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.BitTrainingDatabase>(_i3.BitTrainingDatabase());
  gh.singleton<_i4.TodoService>(_i4.TodoService());
  gh.factory<_i5.TodoStateProvider>(
      () => _i5.TodoStateProvider(get<_i4.TodoService>()));
  return get;
}

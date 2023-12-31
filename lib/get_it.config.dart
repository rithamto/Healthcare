// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'common/storage/app_prefs.dart' as _i3;
import 'get_it.dart' as _i9;
import 'repositories/data_repository.dart' as _i5;

Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  await gh.factoryAsync<_i3.AppPref>(
    () => appModule.appPrefs,
    preResolve: true,
  );
  gh.lazySingleton<_i5.DataRepository>(() => _i5.DataRepository());
  return getIt;
}

class _$AppModule extends _i9.AppModule {}

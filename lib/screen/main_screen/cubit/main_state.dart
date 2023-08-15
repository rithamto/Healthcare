part of 'main_cubit.dart';

@freezed
class MainStateData with _$MainStateData {
  const factory MainStateData({
    @Default("") String count,
  }) = _MainStateData;
}

@freezed
class MainState with _$MainState {
  const factory MainState.initial({MainStateData? data}) = Initial;
  const factory MainState.getMenu({MainStateData? data}) = GetMenu;
}
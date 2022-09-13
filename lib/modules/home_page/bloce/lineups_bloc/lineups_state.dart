part of 'lineups_bloc.dart';

abstract class LineupsState {
  const LineupsState();
}

class LineupsInitialState extends LineupsState {}

class LineupsLoadingState extends LineupsState {}

class LineupsFailedState extends LineupsState {
  final String error;

  const LineupsFailedState({required this.error});
}

class LineupsSuccessState extends LineupsState {
  final List<LineupItemModel> lineups;

  const LineupsSuccessState({required this.lineups});
}

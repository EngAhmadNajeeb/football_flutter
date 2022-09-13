part of 'fixtures_bloc.dart';

abstract class FixturesState {
  const FixturesState();
}

class FixturesInitialState extends FixturesState {}

class FixturesLoadingState extends FixturesState {}

class FixturesFailedState extends FixturesState {
  final String error;

  const FixturesFailedState({required this.error});
}

class FixturesSuccessState extends FixturesState {
  final List<FixtureItemModel> fixtures;

  const FixturesSuccessState({required this.fixtures});
}

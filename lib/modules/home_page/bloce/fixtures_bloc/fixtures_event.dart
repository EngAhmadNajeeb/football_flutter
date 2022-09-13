part of 'fixtures_bloc.dart';

@immutable
abstract class FixturesEvent {
  List<Object> get props => [];
}

class GetFixturesEvent extends FixturesEvent {
  GetFixturesEvent();
}

part of 'lineups_bloc.dart';

@immutable
abstract class LineupsEvent {
  List<Object> get props => [];
}

class GetLineupsEvent extends LineupsEvent {
  final int fixtureId;
  GetLineupsEvent(
    this.fixtureId,
  );
}

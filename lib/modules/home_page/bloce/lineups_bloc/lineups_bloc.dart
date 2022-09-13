import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_flutter/models/lineup_models/lineup_item_model.dart';
import 'package:football_flutter/models/responses/response_model.dart';
import 'package:football_flutter/repository/lineups_repo.dart';

part 'lineups_event.dart';
part 'lineups_state.dart';

class LineupsBloc extends Bloc<GetLineupsEvent, LineupsState> {
  LineupsBloc() : super(LineupsInitialState()) {
    on<GetLineupsEvent>(
        (GetLineupsEvent event, Emitter<LineupsState> emit) async {
      try {
        log('Get Lineups');
        emit(LineupsLoadingState());
        final ResponseModel response =
            await LineupsRepo.getLineups(event.fixtureId);
        if (response.message != null) {
          emit(LineupsFailedState(error: response.message!));
        } else if (response.errors != null) {
          emit(LineupsFailedState(error: response.errors!));
        } else {
          emit(
            LineupsSuccessState(
                lineups: List<LineupItemModel>.from(response.response!
                    .map((fixture) => LineupItemModel.fromMap(fixture)))),
          );
        }
      } catch (e) {
        emit(LineupsFailedState(error: e.toString()));
      }
    });
  }
}

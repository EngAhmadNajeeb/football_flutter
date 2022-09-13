import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_flutter/models/fixture_models/fixture_item_model.dart';
import 'package:football_flutter/models/responses/response_model.dart';
import 'package:football_flutter/repository/fixtures_repo.dart';
part 'fixtures_event.dart';
part 'fixtures_state.dart';

class FixturesBloc extends Bloc<GetFixturesEvent, FixturesState> {
  FixturesBloc() : super(FixturesInitialState()) {
    on<GetFixturesEvent>(
        (GetFixturesEvent event, Emitter<FixturesState> emit) async {
      try {
        log('Get Fixtures');
        emit(FixturesLoadingState());
        final ResponseModel response = await FixturesRepo.getFixtures();
        if (response.message != null) {
          emit(FixturesFailedState(error: response.message!));
        } else if (response.errors != null) {
          emit(FixturesFailedState(error: response.errors!));
        } else {
          emit(
            FixturesSuccessState(
                fixtures: List<FixtureItemModel>.from(response.response!
                    .map((fixture) => FixtureItemModel.fromMap(fixture)))),
          );
        }
      } catch (e) {
        emit(FixturesFailedState(error: e.toString()));
      }
    });
  }
}

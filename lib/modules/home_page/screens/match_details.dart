import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_flutter/models/fixture_models/fixture_item_model.dart';
import 'package:football_flutter/modules/home_page/bloce/lineups_bloc/lineups_bloc.dart';
import 'package:football_flutter/modules/home_page/cards/fixture_cars.dart';
import 'package:football_flutter/modules/home_page/cards/player_card.dart';
import 'package:football_flutter/shared/resources/app_images.dart';

class MatchDetails extends StatefulWidget {
  const MatchDetails({Key? key, required this.fixture}) : super(key: key);
  final FixtureItemModel fixture;
  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {
  late LineupsBloc lineupsBloc = LineupsBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FixtureCard(fixture: widget.fixture),
            Expanded(
              child: BlocProvider<LineupsBloc>(
                create: (_) => lineupsBloc
                  ..add(GetLineupsEvent(widget.fixture.fixture.id)),
                child: Stack(
                  children: [
                    Image.asset(
                      AppImages.kFootballArena,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    BlocBuilder<LineupsBloc, LineupsState>(
                      builder: (context, state) {
                        if (state is LineupsInitialState) {
                          return Container();
                        } else if (state is LineupsLoadingState) {
                          return Center(
                            child: CupertinoActivityIndicator(
                              color: Colors.amber[800],
                              radius: 30,
                            ),
                          );
                        } else if (state is LineupsSuccessState) {
                          if (state.lineups.isEmpty) {
                            return const Center(
                                child: Text('There is no data to display'));
                          } else {
                            List<Widget> colmns1 = [];
                            int colmns1No =
                                state.lineups.first.listFormation.length + 1;
                            for (var i = 1; i <= colmns1No; i++) {
                              List<Widget> rows = [];
                              for (var element in state.lineups.first.startXI) {
                                if (int.tryParse(element.grid.split(':')[0]) ==
                                    i) {
                                  rows.add(
                                    PlayerCard(
                                      player: element,
                                      playerColores: state
                                          .lineups.first.team.colors!.player,
                                    ),
                                  );
                                }
                              }
                              colmns1.add(Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: rows,
                              ));
                            }
                            // ==============================================
                            List<Widget> colmns2 = [];
                            int colmns2No =
                                state.lineups.last.listFormation.length + 1;
                            for (var i = 1; i <= colmns2No; i++) {
                              List<Widget> rows = [];
                              for (var element in state.lineups.last.startXI) {
                                if (int.tryParse(element.grid.split(':')[0]) ==
                                    i) {
                                  rows.add(
                                    PlayerCard(
                                      player: element,
                                      playerColores: state
                                          .lineups.last.team.colors!.player,
                                    ),
                                  );
                                }
                              }
                              colmns2.add(Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: rows,
                              ));
                            }
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: colmns1,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      verticalDirection: VerticalDirection.up,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: colmns2,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        } else if (state is LineupsFailedState) {
                          Fluttertoast.showToast(msg: state.error);
                          return Center(child: Text(state.error));
                        } else {
                          Fluttertoast.showToast(msg: "Fetch lineups failure");
                          return const Center(
                              child: Text('Fetch fixture failure'));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

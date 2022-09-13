import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_flutter/modules/home_page/bloce/fixtures_bloc/fixtures_bloc.dart';
import 'package:football_flutter/modules/home_page/cards/fixture_cars.dart';
import 'package:football_flutter/modules/home_page/screens/match_details.dart';
import 'package:football_flutter/utilities/navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FixturesBloc, FixturesState>(
          builder: (context, state) {
            if (state is FixturesInitialState) {
              context.read<FixturesBloc>().add(GetFixturesEvent());
              return Container();
            } else if (state is FixturesLoadingState) {
              return Center(
                child: CupertinoActivityIndicator(
                  color: Colors.amber[800],
                  radius: 30,
                ),
              );
            } else if (state is FixturesSuccessState) {
              if (state.fixtures.isEmpty) {
                return const Center(child: Text('There is no data to display'));
              } else {
                return ListView.builder(
                  itemCount: state.fixtures.length,
                  // scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        pushPage(
                          context,
                          MatchDetails(fixture: state.fixtures[index]),
                        );
                      },
                      child: FixtureCard(fixture: state.fixtures[index]),
                    );
                  },
                );
              }
            } else if (state is FixturesFailedState) {
              Fluttertoast.showToast(msg: state.error);
              return Center(child: Text(state.error));
            } else {
              Fluttertoast.showToast(msg: "Fetch fixture failure");
              return const Center(child: Text('Fetch fixture failure'));
            }
          },
        ),
      ),
    );
  }
}

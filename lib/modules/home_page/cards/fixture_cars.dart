import 'package:flutter/material.dart';
import 'package:football_flutter/models/fixture_models/fixture_item_model.dart';
import 'package:football_flutter/shared/components/load_network_image.dart';
import 'package:football_flutter/utilities/app_date_formatter.dart';

class FixtureCard extends StatelessWidget {
  const FixtureCard({Key? key, required this.fixture}) : super(key: key);
  final FixtureItemModel fixture;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Card(
              color: Colors.grey[200],
              child: Text(AppDateFormatter.dateFormat(
                  DateTime.parse(fixture.fixture.date))),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      LoadNetworkImage(
                        src: fixture.teams.home.logo,
                        width: MediaQuery.of(context).size.width / 5,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        fixture.teams.home.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "${fixture.goals.home}-${fixture.goals.away}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      LoadNetworkImage(
                        src: fixture.teams.away.logo,
                        width: MediaQuery.of(context).size.width / 5,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        fixture.teams.away.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

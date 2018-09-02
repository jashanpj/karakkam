import 'package:flutter/material.dart';
import 'package:karakkam/activities/popular_activity_card.dart';
import 'package:karakkam/model/activity.dart';


class PopularActivitySection extends StatelessWidget {
  final List<Activity> _activity;

  PopularActivitySection(this._activity);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Popular Activities",
          style: TextStyle(color: Colors.white),
        ),
        Container(
          height: 8.0,
        ),
        Container(
          height: 250.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _activity
                .map((Activity activity) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: PopularActivityCard(activity),
            ))
                .toList(),
          ),
        )
      ],
    );
  }
}

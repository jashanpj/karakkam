import 'package:flutter/material.dart';
import 'package:karakkam/activities/activitycard.dart';
import 'package:karakkam/model/activity.dart';


class ActivitySection extends StatelessWidget {
  final List<Activity> _activity;

  ActivitySection(this._activity);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Recent Activities",
          style: TextStyle(color: Colors.white),
        ),
        Container(
          height: 8.0,
        ),
        Container(
          height: 140.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _activity
                .map((Activity activity) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ActivityCard(activity),
            ))
                .toList(),
          ),
        )
      ],
    );
  }
}

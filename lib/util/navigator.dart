import 'package:flutter/material.dart';
import 'package:karakkam/activities/activity_details_presenter.dart';
import 'package:karakkam/activities/activity_details_screen.dart';
import 'package:karakkam/activities/activity_detail_page.dart';
import 'package:karakkam/model/activity.dart';

goToActivityDetails(BuildContext context, Activity activity) {
  _pushWidgetWithFade(context, ActivityDetailsPresenter(activity));
  //_pushWidgetWithFade(context, ActivityDetailScreen(activity));
}


_pushWidgetWithFade(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    PageRouteBuilder(
        transitionsBuilder:
            (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return widget;
        }),
  );
}
import 'package:flutter/material.dart';
import 'package:karakkam/model/activity.dart';
import 'package:karakkam/util/bottomgradient.dart';
import 'package:karakkam/util/navigator.dart';
import 'package:karakkam/util/styles.dart';



class ActivityCard extends StatelessWidget {
  final double height;
  final double width;
  final Activity activity;

  ActivityCard(this.activity, {this.height: 140.0, this.width: 100.0});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => goToActivityDetails(context, activity),
      child: Container(
        height: height,
        width: width,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: 'No1-'+activity.id,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/placeholder.jpg',
                image: activity.profilePicture,
                //actor.profilePictureUrl,
                fit: BoxFit.cover,
                height: height,
                width: width,
              ),
            ),
            BottomGradient.noOffset(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(activity.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.0),
                  ),
                  Container(
                    height: 4.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Icon(
                            Icons.person,
                            color: salmon,
                            size: 10.0,
                          )),
                      Container(
                        width: 4.0,
                      ),
                      Expanded(
                        flex: 8,
                        child: Text("Activity Character",
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 8.0)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

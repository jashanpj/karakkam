import 'package:flutter/material.dart';
import 'package:karakkam/model/activity.dart';
import 'package:karakkam/util/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:karakkam/util/navigator.dart';


class PopularActivityCard extends StatelessWidget {
  PopularActivityCard(this.activity);

  final Activity activity;

  Widget _getTitleSection(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(activity.title,
              style: TextStyle(
                  fontWeight:FontWeight.bold
              ),
            ),
            Row(
              children: [
                Icon(Icons.star,
                    color: Colors.yellow[500], size: 12.0),
                Icon(Icons.star,
                    color: Colors.yellow[500], size: 12.0),
                Icon(Icons.star,
                    color: Colors.yellow[500], size: 12.0),
                Icon(Icons.star,
                    color: Colors.grey, size: 12.0),
                Icon(Icons.star,
                    color: Colors.grey, size: 12.0),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Text('(1022)', style: TextStyle(color: Colors.black87, fontSize: 12.0),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text('|', style: TextStyle(color: Colors.black87, fontSize: 12.0),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text('(10k+ Booked)', style: TextStyle(color: Colors.black87, fontSize: 12.0),),
                ),
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(height: 10.0,),

                Text(activity.oldRate.toString(), style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough
                ),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 10.0),
                  child: Text(activity.newRate.toString(), style: TextStyle(
                      color: Colors.black,
                    fontSize: 15.0

                  ),),
                ),



              ],
            ),


          ],
        )
    ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Card(
              child: InkWell(
                onTap: () => goToActivityDetails(context, activity),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Stack(
                              fit: StackFit.passthrough,
                              children: <Widget>[
                                Hero(
                                  tag: 'cast-activity-'+activity.id,
                                 child: FadeInImage.assetNetwork(
                                    placeholder: "assets/placeholder.jpg",
                                    image: activity.profilePicture,
                                    fit: BoxFit.cover,
                                    width: 280.0,
                                    height: 170.0,
                                    fadeInDuration: Duration(milliseconds: 50),
                                 ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),

                    _getTitleSection(context),

                  ],
                ),
              ),
            ),
          ],
        ),

      ],
    );
  }
}

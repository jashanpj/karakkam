import 'package:flutter/material.dart';
import 'package:karakkam/activities/actvitysection.dart';
import 'package:karakkam/model/activity.dart';
import 'package:karakkam/util/styles.dart';

class ActivityDetailScreen extends StatelessWidget {
  final Activity _activity;

  ActivityDetailScreen(this._activity);

  List<Activity> _activityList;

  @override
  Widget build(BuildContext context) {
    loadList();

    return Scaffold(
      backgroundColor: primary,
      body: NestedScrollView(
        body: _buildBody(context, _activity),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [_buildAppBar(context, _activity)],
      ),
      bottomNavigationBar: Container(
        child: _bottomBar()
      )
    );
  }

  Widget _buildBody(BuildContext context, Activity activity) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          // Top container with Title
          Container(
            margin: const EdgeInsets.all(20.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    'Spent a Wonderful time with school kids, playing'
                    ' Muslim Traditional Oppana',
                    style: new TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      //color: Color.fromARGB(255, 255, 255, 255),
                    )),
                Container(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text('₹ 615',
                        style: new TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange)),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        '900',
                        style: new TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.yellow[500]),
                          Icon(Icons.star, color: Colors.yellow[500]),
                          Icon(Icons.star, color: Colors.yellow[500]),
                          Icon(Icons.star, color: Colors.grey),
                          Icon(Icons.star, color: Colors.grey),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.people),
                    Text('10K+ Booked'),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.access_time),
                          Text('Available Tomorrow')
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

         /*Expanded(
            child: Row(
              children: <Widget>[
                Center(
                    child: AspectRatio(
                        aspectRatio: 1.0,
                        child: Container(
                            padding: EdgeInsets.all(1.0),
                            child: CustomPaint(painter: CrossPainter())))),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.money_off, color: Colors.orangeAccent),
                        Text('No Cancellation')
                      ],
                    ),
                  ],
                )
              ],

            ),
          ),*/

         Column(

         ),

          Expanded(
          child:Container(
            decoration: BoxDecoration(color: primary),
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _activityList == null
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : ActivitySection(_activityList)),
          ),
    ),

          // Bottom Button Container
           /*Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 1.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: new Icon(Icons.favorite_border),
                        tooltip: 'set as favourite',
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                child: RaisedButton(
                                  child: Text("View Cart"),
                                  color: Theme.of(context).accentColor,
                                  elevation: 4.0,
                                  splashColor: Colors.blueGrey,
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                width: 10.0,
                              ),
                              Expanded(
                                child: RaisedButton(
                                  child: Text("Book Now"),
                                  color: Colors.red,
                                  elevation: 4.0,
                                  splashColor: Colors.blueGrey,
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),*/

        ],
      ),
    );
  }

  Widget _bottomBar(){
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 2.0
        )
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: new Icon(Icons.favorite_border),
            tooltip: 'set as favourite',
            onPressed: (){},
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("View Cart"),
                  color: Colors.yellow,
                  elevation: 4.0,
                  splashColor: Colors.blueGrey,
                  onPressed: () {},
                ),

                RaisedButton(
                  child: Text("Book Now"),
                  color: Colors.red,
                  elevation: 4.0,
                  splashColor: Colors.blueGrey,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, Activity activity) {
    return SliverAppBar(
      expandedHeight: 250.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: "Movie-Tag-",
              child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: "assets/placeholder.jpg",
                image: testImageUrl,
              ),
            ),
            // BottomGradient()

            // _buildMetaSection(movie)
          ],
        ),
      ),
    );
  }

  void loadList() {
    _activityList = new List();
    _activityList.clear();
    for (int a = 0; a <= 4; a++) {
      Activity act = new Activity();
      act.title = "TestActivity $a";
      act.id = a.toString();
      _activityList.add(act);
    }
  }

/*Widget _buildMoviesSection(Future<List<MediaItem>> future) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<List<MediaItem>> snapshot) {
        return snapshot.hasData
            ? ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              MediaListItem(snapshot.data[index]),
          itemCount: snapshot.data.length,
        )
            : Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }*/
}

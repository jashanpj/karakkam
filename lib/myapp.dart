import 'dart:async';
import 'package:flutter/material.dart';
import 'package:karakkam/activities/actvitysection.dart';
import 'package:karakkam/activities/popularactivities.dart';
import 'package:karakkam/model/activity.dart';
import 'package:karakkam/util/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  List<DocumentSnapshot> documents;

  @override
  Widget build(BuildContext context) {

    return new StreamBuilder(
        stream: Firestore.instance.collection('books').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          print("homePage: Inside stream builder");
          if (!snapshot.hasData) return CircularProgressIndicator();
          documents = snapshot.data.documents;
          print("activity_list: documents " + documents.length.toString());
          DocumentSnapshot snap = documents.elementAt(1);
          print(snap.data['author']);

          return new MaterialApp(
            title: 'Flutter Demo',
            theme: new ThemeData(
              // This is the theme of your application.
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
              // counter didn't reset back to zero; the application is not restarted.
              primarySwatch: Colors.yellow,
            ),
            home: new MyHomePage(title: 'VAAKA'),
          );
        });


  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Activity> _activityList;
  bool finished = false;

  _loadactivities(){}

  @override
  void initState() {
    finished = false;
    _activityList = new List();
    _activityList.clear();
    _loadactivities();
    CollectionReference collectionReference = Firestore.instance.collection("activity");
    snp = collectionReference.snapshots().listen((dataSnapshots){
      Activity activity;

      for (int i=0; i<dataSnapshots.documents.length; i++ ){
        
        DocumentSnapshot snapshot = dataSnapshots.documents[i];
        activity = new Activity();
        activity.id = dataSnapshots.documents[i].documentID; print("Document id- $dataSnapshots.documents[i].documentID");
        activity.title = snapshot.data['title'];
        activity.newRate = snapshot.data['new_rate'];
        activity.oldRate = snapshot.data['old_rate'];
        activity.profilePicture = snapshot.data['cover_pic'];

        _activityList.add(activity);
        print(snapshot.data['old_rate']);

      }
      print("length");
      print(dataSnapshots.documents.length);

      setState(() {
        finished = true;
      });
    });
    print("activgitylist count"+_activityList.length.toString());
    /*for(int a=0; a <= 4; a++){
      Activity act = new Activity();
      act.title = "TestActivity $a";
      act.id = a;
      _activityList.add(act);

    }*/
    super.initState();
  }

  StreamSubscription<QuerySnapshot> snp;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      backgroundColor: primary,
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),

      floatingActionButton: new FloatingActionButton(
        tooltip: 'Increment',
        onPressed: (){},
        child: new Icon(Icons.search),
      ),
      body: !finished? _loadingView
          : CustomScrollView(
        slivers: <Widget>[
          _buildAppBar(),
          _buildContentSection(),
        ],
      )
    );
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  _buildAppBar() {
    String coverpic = "https://www.keralatourism.org/images/destination/large/fort_kochi20131031104449_422_1.jpg";

        //"https://timesofindia.indiatimes.com/thumb/49373369.cms?width=423&height=281";

    return SliverAppBar(
      expandedHeight: 400.0,
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
                  image: coverpic,
              ),
            ),
            //BottomGradient(),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 30.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            'YOURS TO EXPLORE',
                            style: new TextStyle(
                                fontSize: 33.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                            )
                        ),
                        Container(
                          height: 10.0,
                        ),
                        Text(
                            'Discover and book amazing things to do at exclusive price',
                            style: new TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 255, 255, 255)
                            )
                        ),
                      ],
                    )
                ),
              ],

            ),
           // _buildMetaSection(movie)
          ],
        ),
      ),
      
    );
  }

  _buildContentSection() {
    return SliverList(
      delegate: SliverChildListDelegate(<Widget>[
        /*Container(
          decoration: BoxDecoration(color: const Color(0xff222128)),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "SYNOPSIS",
                  style: const TextStyle(color: Colors.white),
                ),
                Container(
                  height: 8.0,
                ),
                Text("media.overview",
                    style:
                    const TextStyle(color: Colors.white, fontSize: 12.0)),
                Container(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),*/
        Container(
          decoration: BoxDecoration(color: primary),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _activityList == null
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : ActivitySection(_activityList)),
        ),
        Container(
          decoration: BoxDecoration(color: primaryDark),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: _activityList == null
                  ? Center(
                child: CircularProgressIndicator(),
              )
                 // : ActivitySection(_activityList)),
                    : PopularActivitySection(_activityList)),
        ),
        /*Container(
          decoration: BoxDecoration(color: primaryDark),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _activityList == null
                  ? Center(
                child: CircularProgressIndicator(),
              )
                    : ActivitySection(_activityList)),
                    //: PopularActivitySection(_activityList)),
        ),*/
        /*Container(
            decoration: BoxDecoration(
                color: (widget._mediaItem.type == MediaType.movie
                    ? primary
                    : primaryDark)),
            child: _similarMedia == null
                ? Container()
                : SimilarSection(_similarMedia))*/
      ]),
    );
  }


}
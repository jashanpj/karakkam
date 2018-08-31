import 'package:flutter/material.dart';
import 'package:karakkam/activities/cross_painter.dart';
import 'package:karakkam/model/activity.dart';
import 'package:karakkam/model/package_option-model.dart';
import 'package:karakkam/util/styles.dart';

class ActivityDetailsPresenter extends StatefulWidget {
  ActivityDetailsPresenter(this.activity);

  _ActivityDetailsPresenterState createState() =>
      new _ActivityDetailsPresenterState();

  final Activity activity;
}

class _ActivityDetailsPresenterState extends State<ActivityDetailsPresenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: _bottomBar(),
      ),
      body: CustomScrollView(slivers: <Widget>[
        _buildAppBar(),
        _buildListSection(),
      ]),
    );
  }


  _buildListSection() {
    return SliverList(
      delegate: SliverChildListDelegate(<Widget>[
        Column(
          children: <Widget>[
            _titleCard(),
            _featureCard(),
            _breifCard(),
            _reviewCard(),
            _packageCard(),
            _whattoCard(),
            _activityInfoCard(),
            _howtouseCard(),
            _cancellationCard()
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              height: 0.5,
              color: Colors.red,
            ),
          ],
        ),
      ]),
    );
  }

  Widget _bottomBar() {
    return Container(
      decoration: new BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 2.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: new Icon(Icons.favorite_border),
            tooltip: 'set as favourite',
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: RaisedButton(
                      child: Text("Add to Cart"),
                      color: Colors.yellow,
                      elevation: 4.0,
                      splashColor: Colors.blueGrey,
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: RaisedButton(
                      child: Text("Book Now"),
                      color: Colors.red,
                      elevation: 4.0,
                      splashColor: Colors.blueGrey,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 240.0,
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
                image: widget.activity.profilePicture,
              ),
            ),
            //BottomGradient(),
          ],
        ),
      ),
    );
  }

  Widget _featureCard() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 5.0),
        color: Colors.white,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.monetization_on, color: Colors.orangeAccent),
                Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: Text("No Cancellation Policiy"))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.print, color: Colors.orangeAccent),
                Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: Text("Show Mobile or Printed Voucher"))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.language, color: Colors.orangeAccent),
                Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: Text("English/Spanish/German/Hindi"))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.person_add, color: Colors.orangeAccent),
                Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: Text("Join in Group"))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.directions_car, color: Colors.orangeAccent),
                Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: Text("Meet up with Guide"))
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                height: 0.5,
                color: Colors.grey,
              )
            ],
          ),
        ]));
  }

  Widget _breifCard() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.arrow_right, color: Colors.black54),
                  Container(
                    //margin: const EdgeInsets.only(left: 10.0),
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                          child: Text(
                              "A Wrap lays out each child and attempts to place"
                                  " the child adjacent to the previous child in the main "
                                  "axis, given by direction, leaving spacing space in "
                                  "between. If there is not enough space to fit the child, "
                                  "Wrap creates a new run adjacent to the existing children "
                                  "in the cross axis"),
                        ),
                      ))
                ],
              ),
            ), //Text Paragraph
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.arrow_right, color: Colors.black54),
                  Container(
                    //margin: const EdgeInsets.only(left: 10.0),
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                          child: Text(
                              "A Wrap lays out each child and attempts to place"),
                        ),
                      ))
                ],
              ),
            ), //Text Paragraph
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.arrow_right, color: Colors.black54),
                  Container(
                    //margin: const EdgeInsets.only(left: 10.0),
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                          child: Text(
                              "A Wrap lays out each child and attempts to place"
                                  " the child adjacent to the previous child in the main "
                                  "axis, given by direction, leaving spacing space in "),
                        ),
                      ))
                ],
              ),
            ), //Text Paragraph
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.arrow_right, color: Colors.black54),
                  Container(
                    //margin: const EdgeInsets.only(left: 10.0),
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                          child: Text(
                              "A Wrap lays out each child and attempts to place"
                                  " the child adjacent to the previous child in the main "
                                  "axis, given by direction, leaving spacing space in "
                                  "between. If there is not enough space to fit the child, "
                                  "Wrap creates a new run adjacent to the existing children "
                                  "in the cross axis"),
                        ),
                      ))
                ],
              ),
            ), //Text Paragraph
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  height: 0.5,
                  color: Colors.grey,
                )
              ],
            ),
          ],
        )
    );
  }

  Widget _reviewCard() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
        color: Colors.white,
        child: Column(
          // Main Colum for review card
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  // Second Main column
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      // Reveiew Heading Row
                      children: <Widget>[
                        Text(
                          'Reviews',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ), //Review heading row end
                    Row(
                      // review text with star row
                      children: <Widget>[
                        Text(
                          "4.5",
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.yellow[500], size: 20.0),
                                  Icon(Icons.star,
                                      color: Colors.yellow[500], size: 20.0),
                                  Icon(Icons.star,
                                      color: Colors.yellow[500], size: 20.0),
                                  Icon(Icons.star,
                                      color: Colors.grey, size: 20.0),
                                  Icon(Icons.star,
                                      color: Colors.grey, size: 20.0),
                                ],
                              ),
                              Text(
                                "229 Reviews",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 13.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ), // review text with star row ends
                    Row(
                      children: <Widget>[
                        Row(
                          // User image name start row
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              // User image container place in row
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(testImageUrl))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Jack WIlsion',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15.0,
                                              color: Colors.black)),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors.yellow[500],
                                              size: 13.0),
                                          Icon(Icons.star,
                                              color: Colors.yellow[500],
                                              size: 13.0),
                                          Icon(Icons.star,
                                              color: Colors.yellow[500],
                                              size: 13.0),
                                          Icon(Icons.star,
                                              color: Colors.grey, size: 13.0),
                                          Icon(Icons.star,
                                              color: Colors.grey, size: 13.0),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  '20 August 2018',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 11.0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ), // User image, start name row end here

                    Row(
                      // Review comment row
                      children: <Widget>[
                        Container(
                          //margin: const EdgeInsets.only(left: 10.0),
                            child: Expanded(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 45.0, top: 5.0),
                                child: Text(
                                    "A Wrap lays out each child and attempts to place"
                                        " the child adjacent to the previous child in the main "
                                        "axis, given by direction, leaving spacing space in "
                                        "between. If there is not enough space to fit the child, "
                                        "Wrap creates a new run adjacent to the existing children "
                                        "in the cross axis"),
                              ),
                            )),
                      ],
                    ), // User review comment
                    Column(
                      children: <Widget>[
                        Container(
                          margin:
                          const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 1.0),
                          height: 0.5,
                          color: Colors.grey,
                        )
                      ],
                    ),

                    Container(
                      child: ButtonTheme(
                        minWidth: double.infinity,
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            'Read all Reviews',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _column_line_separator()
            ]
        )
    );
  }

  _titleCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 5.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.activity.title,
              style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                //color: Color.fromARGB(255, 255, 255, 255),
              )),
          Container(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Text(widget.activity.newRate.toString(),
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange)),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  widget.activity.oldRate.toString(),
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
          _column_line_separator()
        ],
      ),
    );
  }

  final int packageCount = 2;
  List<PackageOption> packOptItems;

  initpackages() {
    packOptItems = new List();
    PackageOption pckg;
    String title = 'Afternoon-pack';
    String oldrate = '2450';
    String newrate = '1500';
    for (int a = 0; a <= packageCount; a++) {
      pckg = new PackageOption(title + a.toString(), oldrate, newrate);
      packOptItems.add(pckg);
    }
  }

  _packageCard() {
    initpackages();
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white70,
          margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Package Options',
                    style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
             // _packageTileList(packOptItems),
              _packageTile(),
              _packageTile(),
              _column_line_separator()
            ],
          ),
        ),

      ], // main column array
    ); //mian parent column
  }

  Widget _column_line_separator(){
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          height: 0.5,
          color: Colors.grey,
        )
      ],
    );
  }


  _pckgTileListItem(PackageOption item){
    print('INside package list items');
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      item.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    item.newrate,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Text(
                    item.oldrate,
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: visibilityParent
                      ? new Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print('On Tap called in View More');
                          _changed(false, true, 'pack1');
                        },
                        child: Text(
                          'View More',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14.0),
                        ),
                      ),
                    ],
                  )
                      : new Column(
                    children: <Widget>[
                      visibilityPack1
                          ?
                      Column(
                        children: <Widget>[
                          Text('hahaha Success'),
                          GestureDetector(
                            onTap: () {
                              print('On Tap called in View Less');
                              _changed(true, false, 'pack1');
                            },
                            child: Text(
                              'View Less',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14.0),
                            ),
                          )

                        ],
                      ) : new Container()
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
    print("END..");

  }

  Widget _packageTileList(List<PackageOption> pckOptionList) {
    int list_count = pckOptionList.length;
    PackageOption option;
    option = pckOptionList[1];
    _pckgTileListItem(option);
    print('packet option list count-$list_count');

    for (int i = 0; i < list_count; i++) {
      print('i=$i');
      option = pckOptionList[1];
      print('Option title:${option.title}');
      _pckgTileListItem(option);

    }
    print ('1');
    //return Container();


  }


  bool visibilityParent = true;
  bool visibilityPack1 = false;

  void _changed(bool parentvisibile, bool visibility, String field) {
    setState(() {
      if (field == "pack1") {
        visibilityPack1 = visibility;
        visibilityParent = parentvisibile;
      }
    });
  }

  _packageTile() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'After-noon 4 in 1 Promotion',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '2943',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Text(
                    '3500',
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: visibilityParent
                      ? new Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print('On Tap called in View More');
                          _changed(false, true, 'pack1');
                        },
                        child: Text(
                          'View More',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14.0),
                        ),
                      ),
                    ],
                  )
                      : new Column(
                    children: <Widget>[
                      visibilityPack1
                          ?
                      Column(
                        children: <Widget>[
                          Text('hahaha Success'),
                          GestureDetector(
                            onTap: () {
                              print('On Tap called in View Less');
                              _changed(true, false, 'pack1');
                            },
                            child: Text(
                              'View Less',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14.0),
                            ),
                          )

                        ],
                      ) : new Container()
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _whattoCard() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
    color: Colors.white,
    child: Column(
    // Main Colum for review card
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Row(
        children: <Widget>[
          Text('What to Expect', style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),)
        ],
      ),
      Row(
        // Review comment row
        children: <Widget>[
          Container(
            //margin: const EdgeInsets.only(left: 10.0),
              child: Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                  child: Text(
                      "A Wrap lays out each child and attempts to place"
                          " the child adjacent to the previous child in the main "
                          "axis, given by direction, leaving spacing space in "
                          "between. If there is not enough space to fit the child, "
                          "Wrap creates a new run adjacent to the existing children "
                          "in the cross axis A Wrap lays out each child and attempts to place"
                          " the child adjacent to the previous child in the main "
                          "axis, given by direction, leaving spacing space in "
                          "between. If there is not enough space to fit the child, "
                          "Wrap creates a new run adjacent to the existing children "
                          "in the cross axis"),
                ),
              )),
        ],
      ),

      _column_line_separator()
      ]
    )
    );
  }

  Widget _activityInfoCard() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
        color: Colors.white,
        child: Column(
          // Main Colum for review card
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Activity Information', style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              Row(
                // Review comment row
                children: <Widget>[
                  Container(
                    //margin: const EdgeInsets.only(left: 10.0),
                      child: Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                          child: Text(
                              "A Wrap lays out each child and attempts to place"
                                  " the child adjacent to the previous child in the main "
                                  "axis, given by direction, leaving spacing space in "
                                  "between. If there is not enough space to fit the child, "
                                  "Wrap creates a new run adjacent to the existing children "
                                  "in the cross axis A Wrap lays out each child and attempts to place"
                                  " the child adjacent to the previous child in the main "
                                  "axis, given by direction, leaving spacing space in "
                                  "between. If there is not enough space to fit the child, "
                                  "Wrap creates a new run adjacent to the existing children "
                                  "in the cross axis"),
                        ),
                      )),
                ],
              ),
              _column_line_separator()
            ]
        )
    );
  }

  Widget _howtouseCard() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
        color: Colors.white,
        child: Column(
          // Main Colum for review card
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('How To Use', style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              Row(
                // Review comment row
                children: <Widget>[
                  Container(
                    //margin: const EdgeInsets.only(left: 10.0),
                      child: Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                          child: Text(
                              "A Wrap lays out each child and attempts to place"
                                  " the child adjacent to the previous child in the main "
                                  "axis, given by direction, leaving spacing space in "
                                  "between. If there is not enough space to fit the child, "
                                  "Wrap creates a new run adjacent to the existing children "
                                  "in the cross axis A Wrap lays out each child and attempts to place"
                                  " the child adjacent to the previous child in the main "
                                  "axis, given by direction, leaving spacing space in "
                                  "between. If there is not enough space to fit the child, "
                                  "Wrap creates a new run adjacent to the existing children "
                                  "in the cross axis"),
                        ),
                      )),
                ],
              ),
              _column_line_separator()
            ]
        )
    );
  }

  Widget _cancellationCard() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
        color: Colors.white,
        child: Column(
          // Main Colum for review card
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Cancellation Policy', style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              Row(
                // Review comment row
                children: <Widget>[
                  Container(
                    //margin: const EdgeInsets.only(left: 10.0),
                      child: Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                          child: Text(
                              "A Wrap lays out each child and attempts to place"
                                  " the child adjacent to the previous child in the main "
                                  "axis, given by direction, leaving spacing space in "
                                  "between. If there is not enough space to fit the child, "
                                  "Wrap creates a new run adjacent to the existing children "
                                  "in the cross axis A Wrap lays out each child and attempts to place"
                                  " the child adjacent to the previous child in the main "
                                  "axis, given by direction, leaving spacing space in "
                                  "between. If there is not enough space to fit the child, "
                                  "Wrap creates a new run adjacent to the existing children "
                                  "in the cross axis"),
                        ),
                      )),
                ],
              ),
              _column_line_separator()
            ]
        )
    );
  }


}


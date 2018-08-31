import 'package:flutter/material.dart';
import 'package:karakkam/util/utils.dart';


class MetaSection extends StatelessWidget {
  final dynamic data;

  MetaSection(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "About",
          style: TextStyle(color: Colors.white),
        ),
        Container(
          height: 8.0,
        ),
        _getSectionOrContainer('Original Title', 'original_title'),
        _getSectionOrContainer('Original Title', 'original_name'),
        _getSectionOrContainer('Status', 'status'),
        _getSectionOrContainer('Runtime', 'runtime',
            formatterFunction: formatRuntime),
        (data['number_of_seasons'] != null &&
            data['number_of_episodes'] != null)
            ? _getMetaInfoSection(
            'Seasons',
            formatSeasonsAndEpisodes(
                data['number_of_seasons'], data['number_of_episodes']))
            : Container(),
        _getSectionOrContainer('Premiere', 'release_date',
            formatterFunction: formatDate),
        _getSectionOrContainer('Premiere', 'first_air_date',
            formatterFunction: formatDate),
        _getSectionOrContainer('Latest/Next Episode', 'last_air_date',
            formatterFunction: formatDate),
        _getSectionOrContainer('Budget', 'budget',
            formatterFunction: formatNumberToDollars),
        _getSectionOrContainer('Revenue', 'revenue',
            formatterFunction: formatNumberToDollars),
        _getSectionOrContainer('Homepage', 'homepage', isLink: true),
      ],
    );
  }



  Widget _getSectionOrContainer(String title, String content,
      {dynamic formatterFunction, bool isLink: false}) {
    return data[content] == null
        ? Container()
        : _getMetaInfoSection(
        title,
        (formatterFunction != null
            ? formatterFunction(data[content])
            : data[content]),
        isLink: isLink);
  }

  Widget _getMetaInfoSection(String title, String content,
      {bool isLink: false}) {
    if (content == null) return Container();

    var contentSection = Expanded(
      flex: 4,
      child: GestureDetector(
        child: Text(
          content,
          style: TextStyle(
              color: isLink ? Colors.blue : Colors.white, fontSize: 11.0),
        ),
      ),
    );

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(
                '$title:',
                style: TextStyle(color: Colors.grey, fontSize: 11.0),
              ),
            ),
            contentSection
          ],
        ));
  }
}

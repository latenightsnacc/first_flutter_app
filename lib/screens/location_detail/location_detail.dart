import 'package:flutter/material.dart';

import 'image_banner.dart';

import 'text_section.dart';

import '../../models/location.dart';

class LocationDetail extends StatelessWidget {
  final int _locationID;

  LocationDetail(this._locationID);

  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchByID(_locationID);

    return Scaffold(
      appBar: AppBar(
        title: Text('Location Detail'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageBanner(location.imagePath),
            ]..addAll(textSections(location.locationName)),
          ),
        ],
      ),
    );
  }

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.factTitle, fact.factText))
        .toList();
  }
}

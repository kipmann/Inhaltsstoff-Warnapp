import 'dart:ui';

import 'package:Inhaltsstoff_Warnapp/backend/ScanResult.dart';
import 'package:Inhaltsstoff_Warnapp/customWidgets/ResultCircle.dart';
import 'package:flutter/material.dart';

class ScanningProductDetails extends StatelessWidget {
  const ScanningProductDetails(
      this.preferencesResults, this.otherIngredients, this.moreProductDetails,
      {Key key})
      : super(key: key);

  final Map<String, ScanResult> preferencesResults;
  final List<String> otherIngredients;
  final Map<String, String> moreProductDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Text(
            'Weitere Informationen',
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.all(16.0),
          color: Theme.of(context).accentColor,
        ),
        ExpansionTile(
          title: Text(
            "Präferenzen",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          children: preferencesResults.entries
              .map(
                (entry) => ListTile(
                  title: Text(
                    entry.key,
                    style: Theme.of(context).textTheme.bodyText1,
                  ), //preference
                  trailing: ResultCircle(
                    entry.value,
                    small: true,
                  ), //result
                ),
              )
              .toList(),
        ),
        ExpansionTile(
          title: Text(
            "Andere Inhaltsstoffe",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          children: otherIngredients
              .map(
                (ingredient) => ListTile(
                  title: Text(
                    ingredient,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              )
              .toList(),
        ),
        ExpansionTile(
          title: Text(
            "Weitere Produktdetails",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          children: moreProductDetails.entries
              .map(
                (detail) => ListTile(
                  title: Text(
                    detail.key,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: Text(
                    detail.value,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import './ScanningTextrecognition.dart';
import './ScanningCropImage.dart';
import './ScanningCamera.dart';
import './ScanningResult.dart';
import './ScanningRoot.dart';

class ScanningPage extends StatefulWidget {
  const ScanningPage({Key key}) : super(key: key);

  @override
  _ScanningPageState createState() => _ScanningPageState();
}

class _ScanningPageState extends State<ScanningPage> {

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return ScanningRoot();
              case '/camera':
                return ScanningCamera();  
              case '/crop_image':
                return ScanningCropImage(settings.arguments);    
              case '/result_textrecognition':
                return ScanningTextrecognition(settings.arguments);      
              case '/result':
                return ScanningResult(settings.arguments);
              default: return ScanningRoot();
            }
          },
        );
      },
    );
  }
}

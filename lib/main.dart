import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const platform = const MethodChannel('flutter.rortega.com.channel');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Channel demo app"),
          centerTitle: true,
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(onPressed: _showNativeView,child: Text('Show native view'))
            ],
          ),
        ),
      ),
    );
  }

  Future _showNativeView() async{
    try{
      final result = await platform.invokeMethod('showNativeView');
      print("Result : $result");
    }on PlatformException catch (e){
      print("error : $e");
    }
  }
}

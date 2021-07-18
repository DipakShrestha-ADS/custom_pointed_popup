import 'package:custom_pointed_popup/custom_pointed_popup.dart';
import 'package:custom_pointed_popup/utils/triangle_painter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey widgetKey = GlobalKey();

  CustomPointedPopup getCustomPointedPopup(BuildContext context) {
    return CustomPointedPopup(
      backgroundColor: Colors.red,
      context: context,
      widthFractionWithRespectToDeviceWidth: 3,
      displayBelowWidget: true,
      triangleDirection: TriangleDirection.FullLeft,
      popupElevation: 10,

      ///you can also add border radius
      ////popupBorderRadius:,
      item: CustomPointedPopupItem(
        title: 'Popup that can be shown on any targeted widget with customized pointed design.',
        textStyle: Theme.of(context).textTheme.caption!.copyWith(
              color: Theme.of(context).cardColor,
            ),
        iconWidget: Icon(
          Icons.add_moderator,
          color: Theme.of(context).cardColor,
        ),

        ///Or you can add custom item widget below instead above 3
        ///itemWidget: Container(),
      ),
      onClickWidget: (onClickMenu) {
        print('popup item clicked');
      },
      onDismiss: () {
        print('on dismissed called');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Custom Pointed Popup [CPP]',
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CPP with straight pointer & item.',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  getCustomPointedPopup(context)
                    ..show(
                      widgetKey: widgetKey,
                    );
                },
                child: Card(
                  key: widgetKey,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Text(
                        'Click Me \nTo\n Display CPP',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

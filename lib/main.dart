import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //  This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List titles;
    String title;

    return Scaffold(
      appBar: AppBar(),
      body: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: 9,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    right: 15,
                  ),
                  child: DragBox(
                    "aurduino code $index",
                    Colors.blue,
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 4,
            child: DragTarget(
              onAccept: (String titles) {
                title = titles;
              },
              builder: (context, accepted, rejected) {
                print(accepted);

                return Container(
                  color: Colors.grey,
                  child: Center(
                    child: Text("$title"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      //  body: Stack(
      //    children: [
      //      DragBox(Offset(100.0, 200.0), "aurduino code 1", Colors.lime),
      //      DragBox(Offset(200.0, 200.0), "aurduino code 2", Colors.red),
      //      DragBox(Offset(300.0, 200.0), "aurduino code 3", Colors.orange),
      //      Positioned(
      //        bottom: 0,
      //        left: 50,
      //        child: DragTarget(
      //          onAccept: (String titles) {
      //            title = titles;
      //          },
      //          builder: (context, accepted, rejected) {
      //            print(accepted);

      //            return Container(
      //              width: 200,
      //              height: 200,
      //              color: Colors.grey,
      //              child: Center(
      //                child: Text("$title"),
      //              ),
      //            );
      //          },
      //        ),
      //      ),
      //    ],
      //  ),
    );
  }
}

class DragBox extends StatefulWidget {
  // final Offset initpos;
  final String code;
  final Color itemColor;
  DragBox(this.code, this.itemColor);

  @override
  _DragBoxState createState() => _DragBoxState();
}

class _DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: widget.code,
      child: Container(
        color: widget.itemColor,
        height: 100,
        width: 100,
        child: Card(
          child: Text(
            widget.code,
          ),
        ),
      ),
      onDraggableCanceled: (velocity, offset) {
        setState(() {
          position = offset;
        });
      },
      feedback: Container(
        color: widget.itemColor.withOpacity(0.5),
        width: 100,
        height: 100,
      ),
    );
  }
}

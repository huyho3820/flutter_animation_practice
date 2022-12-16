import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen();

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Arrange your images'),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Stack(children: <Widget>[
            Container(
              width: 1000,
              height: 1000,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/milky-way.jpeg'),
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.noRepeat,
                ),
              ),
            ),
            const DragBox(Offset(100.0, 10.0), 'Box One', Colors.blueAccent, 1),
            const DragBox(Offset(200.0, 50.0), 'Box Two', Colors.orange, 2),
            const DragBox(
                Offset(300.0, 80.0), 'Box Three', Colors.lightGreen, 3),
          ]),
        ));
  }
}

class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;
  final int boxnumber;

  const DragBox(this.initPos, this.label, this.itemColor, this.boxnumber);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = const Offset(0.0, 0.0);
  String imagePath = "";

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  // getBoxPic() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     String key='picture${widget.boxnumber}';
  //     imagePath=prefs.getString(key);
  //   });
  //   print(imagePath);
  //   return File(imagePath);
  // }
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          data: widget.itemColor,
          onDragStarted: () {
            setState(() {
              print("Foobar");
            });
          },
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              position = offset;
              if (widget.boxnumber == 1) {
                print("Wibble");
              }
            });
          },
          feedback: Container(
            width: 120.0,
            height: 120.0,
            color: widget.itemColor.withOpacity(0.5),
            child: Center(
              child: Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          child: Container(
            width: 100.0,
            height: 100.0,
            color: widget.itemColor,
            child: Center(child: Image.asset('assets/images/moon.jpg')),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class WifiSymboxAnimation extends StatefulWidget {
  const WifiSymboxAnimation({super.key});

  @override
  State<WifiSymboxAnimation> createState() => _WifiSymboxAnimationState();
}

class _WifiSymboxAnimationState extends State<WifiSymboxAnimation>
    with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation<double> firstAnimation;

  late AnimationController secondController;
  late Animation<double> secondAnimation;

  late AnimationController thirdController;
  late Animation<double> thirdAnimation;

  late AnimationController fourthController;
  late Animation<double> fourthAnimation;

  @override
  void initState() {
    //begin: .37, end: .3
    firstController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    firstAnimation = Tween<double>(begin: .37, end: .3).animate(
        CurvedAnimation(parent: firstController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    //begin: .5, end: .41
    secondAnimation = Tween<double>(begin: .5, end: .41).animate(
        CurvedAnimation(parent: secondController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          secondController.forward();
        }
      });

    //begin: .63, end: .52
    thirdController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    thirdAnimation = Tween<double>(begin: .63, end: .52).animate(
        CurvedAnimation(parent: thirdController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    //begin: .76, end: .63
    fourthController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    fourthAnimation = Tween<double>(begin: .76, end: .63).animate(
        CurvedAnimation(parent: fourthController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourthController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          fourthController.forward();
        }
      });

    firstController.forward();
    secondController.forward();
    thirdController.forward();
    fourthController.forward();

    super.initState();
  }

  @override
  void dispose() {
    firstController.forward();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6101eb),
      body: Center(
        child: CustomPaint(
          painter: DrawPath(firstAnimation.value, secondAnimation.value,
              thirdAnimation.value, fourthAnimation.value),
          child: const SizedBox(
            height: 250,
            width: 210,
          ),
        ),
      ),
    );
  }
}

class DrawPath extends CustomPainter {
  final double height1;
  final double height2;
  final double height3;
  final double height4;

  DrawPath(this.height1, this.height2, this.height3, this.height4);

  @override
  void paint(Canvas canvas, Size size) {
    Color designColor = const Color(0xffEAEEF0);

    //Constructs an [Paint] object
    //color: The color to use when stroking or filling a shape. (color of paint shape)

    //strokeCap: The kind of finish to place on the end of lines drawn when [style] is set to [PaintingStyle.stroke].
    //StrokeCap: Styles to use for line endings.
    //StrokeCap.round: Begin and end contours (đường viền) with a semi-circle extension.
    //StrokeCap.square: Begin and end contours with a half square extension.
    //StrokeCap.butt: Begin and end contours with a flat edge (cạnh phẳng) and no extension.

    //style -> PaintingStyle: Whether to paint inside shapes, the edges of shapes, or both.
    // PaintingStyle.stroke: Apply the [Paint] to the edge of the shape. (tạo ra Paint có cạnh viền bọc bên ngoài)
    //For example, when applied to the [Canvas.drawCircle] call, this results is a hoop (vòng) of the given size being painted.
    //The line drawn on the edge will be the width given by the [Paint.strokeWidth] property.

    //strokeWidth: How wide to make edges drawn
    Paint firstPaint = Paint()
      ..color = designColor
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;

    // PaintingStyle.fill: Apply the [Paint] to the inside of the shape. (áp dụng Paint vào trong shape, kích thước sẽ trùng khớp với shape (do ko có viền))
    //For example, when applied to the [Canvas.drawCircle] call, this results in a disc of the given size being painted.
    Paint secondPaint = Paint()
      ..color = designColor
      ..style = PaintingStyle.fill;

    // Create a new empty [Path] object.
    // path.moveTo: Starts a new sub-path at the given coordinate. (Move the path to the give coordinate)

    // arcToPoint: Appends (nối) up to (tối đa) four conic (hình nón) curves (đường cong) weighted to describe an oval of radius
    // and rotated by rotation (measured in degrees and clockwise)r.
    // The first curve begins from the last point in the path and the last ends at arcEnd
    Path firstPath = Path()
      ..moveTo(0, size.height * height1)
      ..arcToPoint(Offset(size.width, size.height * height1),
          radius: const Radius.circular(135), clockwise: true);

    // canvas.drawPath: Draws the given [Path] with the given [Paint].
    canvas.drawPath(firstPath, firstPaint);

    Path secondPath = Path()
      ..moveTo(size.width * .16, size.height * height2)
      ..arcToPoint(Offset(size.width * .84, size.height * height2),
          radius: const Radius.circular(90));

    canvas.drawPath(secondPath, firstPaint);

    Path thirdPath = Path()
      ..moveTo(size.width * .33, size.height * height3)
      ..arcToPoint(Offset(size.width * .67, size.height * height3),
          radius: const Radius.circular(43));

    canvas.drawPath(thirdPath, firstPaint);

    //Draws a circle centered at the point given by the first argument
    //and that has the radius given by the second argument, with the [Paint] given in the third argument.
    canvas.drawCircle(
        Offset(size.width * .5, size.height * height4), 17, secondPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

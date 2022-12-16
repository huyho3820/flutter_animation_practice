import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MiniGame extends StatefulWidget {
  const MiniGame({super.key});

  @override
  State<MiniGame> createState() => _MiniGameState();
}

class _MiniGameState extends State<MiniGame>
    with SingleTickerProviderStateMixin {
  double top = 0;
  double left = 0;
  int playTime = 0;
  int highScore = 0;
  late double widthScreen;
  late double heightScreen;
  bool isFirstTime = true;
  bool isDraggable = true;

  List<Map<String, dynamic>> currentList = [];

  final textKey = GlobalKey();

  late Timer genListTimer;
  late Timer rebuildTimer;
  late Timer playTimeTimer;
  final random = Random();

  final keywordTextStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);

  List<String> sampleKeywords = [
    'Đụt',
    'Rớt môn',
    'FA',
    'Táo bón',
    'Nghèo nàn',
    'Nợ nần',
    'Con thơ',
    'Người yêu cũ',
    'Tuesday',
    'Chầm kẽm',
    'Crypto',
    'World cup'
  ];

  void reset() {
    genListTimer.cancel();
    rebuildTimer.cancel();
    playTimeTimer.cancel();
    setState(() {
      currentList = [];
      isFirstTime = true;
      isDraggable = true;
      playTime = 0;
    });

    genListTimer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      var randomKeyword = sampleKeywords[random.nextInt(sampleKeywords.length)];
      currentList.add({
        'id': DateTime.now().toIso8601String(),
        'keyword': randomKeyword,
        'topPosition': random.nextDouble() * heightScreen,
        'leftPosition': random.nextDouble() * widthScreen,
        'heightText': _textSize(randomKeyword, keywordTextStyle).height,
        'widthText': _textSize(randomKeyword, keywordTextStyle).width
      });

      setState(() {});
    });
    rebuildTimer = Timer.periodic(
      const Duration(milliseconds: 200),
      (timer) {
        setState(() {
          checkCollision();
        });
      },
    );

    playTimeTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        playTime += 1;
      },
    );
  }

  @override
  void initState() {
    genListTimer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      var randomKeyword = sampleKeywords[random.nextInt(sampleKeywords.length)];
      currentList.add({
        'id': DateTime.now().toIso8601String(),
        'keyword': randomKeyword,
        'topPosition': random.nextDouble() * heightScreen,
        'leftPosition': random.nextDouble() * widthScreen,
        'heightText': _textSize(randomKeyword, keywordTextStyle).height,
        'widthText': _textSize(randomKeyword, keywordTextStyle).width
      });

      setState(() {});
    });
    rebuildTimer = Timer.periodic(
      const Duration(milliseconds: 200),
      (timer) {
        setState(() {
          checkCollision();
        });
      },
    );
    playTimeTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        playTime += 1;
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    genListTimer.cancel();
    rebuildTimer.cancel();
    playTimeTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    heightScreen = MediaQuery.of(context).size.height;
    top = isFirstTime ? heightScreen / 2 : top;
    left = isFirstTime ? widthScreen / 2 : left;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Không lối thoát',
          style: TextStyle(
              color: Colors.red, fontSize: 25, fontStyle: FontStyle.italic),
        ),
        actions: [
          IconButton(
              onPressed: reset,
              icon: const Icon(
                Icons.replay,
                color: Colors.amber,
              ))
        ],
      ),
      body: Stack(
        children: [
          buildInstructionText(),
          ...currentList.map((item) {
            return TweenAnimationBuilder<Offset>(
                tween: Tween<Offset>(
                    begin: Offset(
                      item['leftPosition'],
                      item['topPosition'],
                    ),
                    end: Offset(left, top)),
                duration: const Duration(seconds: 2),
                builder: (context, currentOffset, child) {
                  int index = currentList
                      .indexWhere((element) => element['id'] == item['id']);
                  item['topPosition'] = currentOffset.dy;
                  item['leftPosition'] = currentOffset.dx;
                  currentList[index] = item;
                  return Positioned(
                      top: item['topPosition'],
                      left: item['leftPosition'],
                      child: Text(
                        '${item['keyword']}',
                        style: keywordTextStyle,
                      ));
                });
          }).toList(),
          Positioned(
              key: textKey,
              top: top,
              left: left,
              child: IgnorePointer(
                ignoring: !isDraggable,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    top = max(0, top + details.delta.dy);
                    left = max(0, left + details.delta.dx);
                    setState(() {
                      isFirstTime = false;
                    });
                    checkCollision();
                  },
                  child: const Text(
                    'Tôi',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Align buildInstructionText() {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Di chuyển \'Tôi\'\nđể tránh xa mọi nghiệt ngã',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Thời gian: $playTime',
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Điểm cao nhất: $highScore',
                    style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  AlertDialog endGameDialog(String keyword, BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Haha, Đồ con gàaaaa =))))',
        style: TextStyle(color: Colors.amber),
      ),
      content: Text(
        'Bạn đã bị ${keyword.toUpperCase()} dập tơi tả',
        style: const TextStyle(color: Colors.red),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Đóng')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              reset();
            },
            child: const Text('Chơi lại'))
      ],
    );
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  void checkCollision() {
    RenderBox boxText = textKey.currentContext!.findRenderObject() as RenderBox;
    final sizeText = boxText.size;
    //final currentPostionText = boxText.localToGlobal(Offset.zero);
    final minDx = left;
    final maxDx = minDx + sizeText.width;
    final minDy = top;
    final maxDy = minDy + sizeText.height;

    for (var keyword in currentList) {
      final currentDxKeyword = keyword['leftPosition'];
      final currentDyKeyword = keyword['topPosition'];
      final currentKeywordWidth = keyword['widthText'];
      final currentKeywordHeight = keyword['heightText'];
      final collide = (minDx < currentDxKeyword + currentKeywordWidth &&
          maxDx > currentDxKeyword &&
          minDy < currentDyKeyword + currentKeywordHeight &&
          maxDy > currentDyKeyword);
      if (collide) {
        showDialog(
          context: context,
          builder: (context) => endGameDialog(keyword['keyword'], context),
        );
        if (playTime > highScore) {
          highScore = playTime;
        }
        setState(() {
          genListTimer.cancel();
          rebuildTimer.cancel();
          playTimeTimer.cancel();
          isDraggable = false;
        });
        break;
      }
    }
  }
}

import 'package:flutter/material.dart';
import '../imageList.dart';

void main() {
  runApp(const CardAppStart());
}

class CardAppStart extends StatelessWidget {
  const CardAppStart({Key? key}) : super(key: key);

  //double screenwidth = MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    //final double screenwidth = MediaQuery.of(context).size.width;
    //final double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: '21CARD',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Container(
          width: 287 * 3,
          height: 1024,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Background(),
              GamePage(),
            ],
          ),
        )),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePage();
}

class _GamePage extends State<GamePage> {
  bool gameStarted = false;
  int raund = 0;

  List<Image> randElemList(List<Image> images) {
    List<Image> bufList = images;
    bufList.shuffle();
    bufList = bufList.sublist(0, 21);
    return bufList;
  }

  void _changeGameStatus() {
    setState(() {
      gameStarted = !gameStarted;
      raund = 0;
      reloadCurList();
    });
  }

  void _updateRaund() {
    setState(() {
      raund++;
    });
  }

  void _chooseColumn(String position) {
    _updateRaund();
    List<Image> bufList = [];
    List<Image> listRight = getListOfPosition('right');
    List<Image> listLeft = getListOfPosition('left');
    List<Image> listCenter = getListOfPosition('center');
    switch (position) {
      case 'center':
        bufList.addAll(listLeft);
        bufList.addAll(listCenter);
        bufList.addAll(listRight);
        break;
      case 'left':
        bufList.addAll(listRight);
        bufList.addAll(listLeft);
        bufList.addAll(listCenter);
        break;
      case 'right':
        bufList.addAll(listCenter);
        bufList.addAll(listRight);
        bufList.addAll(listLeft);
        break;
    }
    curList = bufList;
  }

  @override
  Widget build(BuildContext context) {
    if (!gameStarted) {
      return Center(
          child: GestureDetector(
              onTap: () => _changeGameStatus(),
              child: Container(
                  width: 192,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/button/button4.png'),
                        fit: BoxFit.none),
                  ),
                  child: Center(
                      child: Text('Start',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                          ))))));
    } else if (gameStarted && (raund < 3)) {
      return SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 30,
                  alignment: WrapAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  textDirection: TextDirection.ltr,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 150,
                      child: Column(
                        children: [
                          GestureDetector(
                              onTap: () => _chooseColumn('left'),
                              child: BottomButton()),
                          ImageList(position: "left"),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 150,
                      child: Column(
                        children: [
                          GestureDetector(
                              onTap: () => _chooseColumn('center'),
                              child: BottomButton()),
                          ImageList(position: "center"),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 150,
                      child: Container(
                        width: 60,
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () => _chooseColumn('right'),
                                child: BottomButton()),
                            ImageList(position: 'right'),
                          ],
                        ),
                      ),
                    )
                  ])));
    } else {
      return Center(
          child: Container(
              height: 380,
              width: 200,
              child: Column(children: [
                Container(
                    child: Text("Your card",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ))),
                Container(
                    height: 240,
                    width: 164,
                    color: Colors.lightBlueAccent,
                    child: curList[10]),
                GestureDetector(
                    onTap: () => _changeGameStatus(),
                    child: Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 51,
                        width: 51,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/button/restart_button.png'),
                              fit: BoxFit.none),
                        )))
              ])));
    }
  }
}

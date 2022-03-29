import 'package:flutter/material.dart';
import '../ImageList.dart';


void main() {
  runApp(const CardAppStart());
}

class CardAppStart extends StatelessWidget {
  const CardAppStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '21CARD',
      home: Scaffold(
          body: Center(
              child: Container(
                  height: 1024,
                  width: 768,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/background/background.png'),
                        fit: BoxFit.none),
                  ),
                  child: GamePage(),
              )
          ),
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

  List<Image> randElemList(List<Image> images){
    List<Image> bufList = images;
    bufList.shuffle();
    bufList = bufList.sublist(0,21);
    return bufList;
  }

  void _changeGameStatus(){
    setState(() {
    gameStarted = !gameStarted;
    raund = 0;
    reloadLists();
    });
  }


  void _updateRaund(){
    setState((){
     raund++;
  });
}

  void _chooseColumn(String position){
    _updateRaund();
    List<Image> bufList = [];
    List<Image> listRight = getListOfPosition('right');
    List<Image> listLeft = getListOfPosition('left');
    List<Image> listCenter = getListOfPosition('center');
    switch (position){
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
      return  Center(
            child: GestureDetector(
              onTap: () => _changeGameStatus(),
              child: Container(
                width: 192,
                height: 60,
                decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage('assets/Button/Button4.png'),
                fit: BoxFit.none),
                ),
                child: Center(
                  child: Text(
                  'Start',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  )
                )
              )
            )
          )
      );
    } else if (gameStarted && (raund<3)){
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          textDirection: TextDirection.ltr,
          children: [
            Container(
              margin: EdgeInsets.only(top:50),
              width: 150,
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () => _chooseColumn('left'),
                      child: Container(
                          width: 98,
                          height: 30,
                          margin: EdgeInsets.only(bottom:10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/Button/Button50.png'),
                                fit: BoxFit.none),
                          ),
                          child: Center(
                              child: Text(
                                  'Choose',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  )
                              )
                          )
                      )
                  ),
                  ImageList(position: "left"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:50),
              width: 150,
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () => _chooseColumn('center'),
                      child: Container(
                          width: 98,
                          height: 30,
                          margin: EdgeInsets.only(bottom:10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/Button/Button50.png'),
                                fit: BoxFit.none),
                          ),
                          child: Center(
                              child: Text(
                                  'Choose',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  )
                              )
                          )
                      )
                  ),
                  ImageList(position: "center"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:50),
              width: 150,
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () => _chooseColumn('right'),
                      child: Container(
                          width: 98,
                          height: 30,
                          margin: EdgeInsets.only(bottom:10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/Button/Button50.png'),
                                fit: BoxFit.none),
                          ),
                          child: Center(
                              child: Text(
                                  'Choose',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  )
                              )
                          )
                      )
                  ),
                  ImageList(position: 'right'),
                ],
              ),
            )
          ]
          )
        );
    } else {
      return Center(
        child: Container(
          height: 355,
          width: 200,
          //color: Colors.black,
          child: Column(
            children: [
              Container(
                //color: Colors.blue,
                child: Text(
                    "Your card",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    )
                )
              ),
              Container(
                child: curList[10]
              ),
              GestureDetector(
                onTap: () => _changeGameStatus(),
                child: Container(
                    margin: EdgeInsets.only(top:20),
                    height: 51,
                    width: 51,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Button/RestartButton.png'),
                          fit: BoxFit.none),
                    )
                )
              )
            ]
          )
        )
      );
    }
  }
}

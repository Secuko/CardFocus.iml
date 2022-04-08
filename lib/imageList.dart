import 'package:flutter/material.dart';

List<Image> images = List.generate(
    54, (index) => Image.asset("assets/Cards/${index + 1}.jpg"),
    growable: false);

reloadCurList() {
  curList = randElemList(images);
}

List<Image> curList = randElemList(images);

class ImageList extends StatelessWidget {
  const ImageList({required this.position, Key? key}) : super(key: key);
  final String position;

  @override
  Widget build(BuildContext context) {
    //List<double?> num = [0,-50];
    //double? num = -60.0;
    int index = 0;
    double marginTop = 80;
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      width: 110,
      child: Stack(
        fit: StackFit.loose,
        children: <Container>[
          Container(
            margin: EdgeInsets.only(top: index * marginTop),
            child: getListOfPosition(position)[index],
          ),
          Container(
            margin: EdgeInsets.only(top: index * marginTop),
            child: getListOfPosition(position)[index = ++index],
          ),
          Container(
            margin: EdgeInsets.only(top: index * marginTop),
            child: getListOfPosition(position)[index = ++index],
          ),
          Container(
            margin: EdgeInsets.only(top: index * marginTop),
            child: getListOfPosition(position)[index = ++index],
          ),
          Container(
            margin: EdgeInsets.only(top: index * marginTop),
            child: getListOfPosition(position)[index = ++index],
          ),
          Container(
            margin: EdgeInsets.only(top: index * marginTop),
            child: getListOfPosition(position)[index = ++index],
          ),
          Container(
            margin: EdgeInsets.only(top: index * marginTop),
            child: getListOfPosition(position)[index = ++index],
          )
        ],
      ),
    );

    /*Column(
        //alignment: AlignmentDirectional.topCenter,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          7,
          (index) => Container(
              //width: 82,
              //margin: EdgeInsets.only(top:0),
              padding: const EdgeInsets.symmetric(vertical: 15),
              transform: Matrix4.translationValues(0.0, (index) * num, 0.0),
              child: getListOfPosition(position)[index]),
        ));*/
  }
}

class BottomButtonState extends State<BottomButton>
    with SingleTickerProviderStateMixin {
  /*Tween tween = new Tween<double>(begin: 10.0, end: 180.0);
  Animation<double> animation = tween<double>(begin: 10.0, end: 180.0);

  @override
  void initState() {
    super.initState();
    AnimationController controller = new AnimationController(vsync: this,
        duration: new Duration(seconds: 4));

    // More code here
  }*/
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        margin: EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/button/button1.png'),
              fit: BoxFit.fitHeight),
        ),
        child: const Center(
            child: Text('Choose',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ))));
  }
}

class BottomButton extends StatefulWidget {
  const BottomButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new BottomButtonState();
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          verticalDirection: VerticalDirection.down,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            backElem(),
            backElem(),
            backElem(), //костыль! Присутствие скрола по горизонтали.
          ],
        ),
      ),
    );
  }

  Widget backElem() {
    return Container(
        width: 287,
        margin: EdgeInsets.only(left: 0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background/backgroundShort.png'),
              fit: BoxFit.none),
        ));
  }
}

List<Image> randElemList(List<Image> images) {
  List<Image> bufList = images;
  bufList.shuffle();
  bufList = bufList.sublist(0, 21);
  return bufList;
}

List<Image> getListOfPosition(String position) {
  List<Image> list = [];
  switch (position) {
    case 'center':
      list = curList
          .where((element) => (curList.indexOf(element) + 1) % 3 == 2)
          .toList();
      break;
    case 'left':
      list = curList
          .where((element) => (curList.indexOf(element) + 1) % 3 == 1)
          .toList();
      break;
    case 'right':
      list = curList
          .where((element) => (curList.indexOf(element) + 1) % 3 == 0)
          .toList();
  }
  return list;
}

import 'package:flutter/material.dart';
List<Image> images =  List.generate(26, (index) => Image.asset("assets/Cards/${index + 1}.png"), growable: false);

reloadLists(){
  List<Image> curList = randElemList(images);
}
List<Image> curList = randElemList(images);


class ImageList extends StatelessWidget{
  ImageList({required this.position, Key? key}):super(key: key);
  final String position;

  @override
  Widget build(BuildContext context){
    //List<double?> num = [0,-50];
    double? num = -60.0;
    return Column(
      //alignment: AlignmentDirectional.topCenter,
      children: List.generate(
              7,
              (index) => Container(
                width: 82,
                  //margin: EdgeInsets.only(top:0),
                  transform: Matrix4.translationValues(0.0, (index)*num, 0.0),
                  child: getListOfPosition(position)[index]),
      )
    );
  }
}

List<Image> randElemList(List<Image> images){
  List<Image> bufList = images;
  bufList.shuffle();
  bufList = bufList.sublist(0,21);
  return bufList;
}

List<Image> getListOfPosition(String position){
  List<Image> list = [];
  switch (position){
    case 'center':
      list = curList.where((element) => (curList.indexOf(element) + 1) % 3 == 2).toList();
      break;
    case 'left':
      list = curList.where((element) => (curList.indexOf(element) + 1) % 3 == 1).toList();
      break;
    case 'right':
      list = curList.where((element) => (curList.indexOf(element) + 1) % 3 == 0).toList();

  }
  return list;
}
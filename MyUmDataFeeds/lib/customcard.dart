import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String img;
  final String title;
  final String summary;
  const CustomCard( this.img, this.title, this.summary, {super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(16),
      child:Image.network(widget.img, width: 100,) ,)
      ,
      Expanded(child: 
      Column(children: <Widget>[
        Text(widget.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,          
        ),textAlign: TextAlign.left, )
        ,
         Text(widget.summary)
        
      ],))
      
    ],);
  }
}
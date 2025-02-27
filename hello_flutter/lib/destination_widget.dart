// shortcuts: stless or stful
import 'package:flutter/material.dart';

class DestinationWidget extends StatelessWidget {
  const DestinationWidget({super.key, required this.destinationName});
  final String destinationName; 

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image(image: NetworkImage(("https://picsum.photos/30/30"),)),
      Text(destinationName)
      ]);
  }
}
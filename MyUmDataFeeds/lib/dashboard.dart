

  import 'package:flutter/material.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

  class _DashboardState extends State<Dashboard> {
    @override
    Widget build(BuildContext context) {
      return Column(
        children: <Widget>[
          Image.network("https://news.miami.edu/_assets/images-stories/2025/03/fec-week-hero-940x529.jpg", width: 400,),
          Text("Title goes here", style: TextStyle(color: Colors.deepOrange),),
          Padding(padding: EdgeInsets.all(30),
          child:Text("Long text goes here....."))
        ],

      );
    }
  }


      class Dashboard2 extends StatefulWidget {
        const Dashboard2({super.key});

        @override
        State<Dashboard2> createState() => _Dashboard2State();
      }

      class _Dashboard2State extends State<Dashboard2> {
        @override
        Widget build(BuildContext context) {
          return const Placeholder();
        }
      }


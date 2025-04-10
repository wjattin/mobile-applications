import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConverterMain());
}

// create a new stateless widget 

class TemperatureConverterMain extends StatelessWidget {
  const TemperatureConverterMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TemperatureConverter(),
    );
  }
}
// the actual app
class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  // All class variables 
   int groupValue = 0;
   double T = 0;//temperature to convert
   double R = 0;//converted value

   //Holds the display text for the last Text widget 
   String converted = "";

   double sliderValue = 20.0;
   Color sliderColor = Colors.black;

   //custom methods/functions 
   performConversion(int value) {
    
    setState(() {

    groupValue = value;

    // Formulas 
    // C = ( F - 32 ) X ( 5/9 )
    // F = ( C X 9/5 ) + 32
    //value holds the value of the checked radio button 1 or 2
    if(value == 1) {
      //F to C
      R = ( T - 32 ) * ( 5/9 );
      converted = "$R C ";

      //

    } else if (value == 2) {
      // C to F
      R = (T * 1.8 ) + 32;
      converted = "$R F ";

    }
      print(R);
    });
   }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Temperature Converter"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(36.0),
        child:Column(
          children: <Widget> [
            SizedBox( height: 10.0),
            TextField(
              decoration: InputDecoration(labelText: "Enter Temperature"),
              onChanged: (String value) {
                //TODO something with value
                if(value == "") {
                  //HEy! write something
                } else {
                  T =  double.parse(value); 
                }
              },
            ),
            SizedBox( height: 10.0),
            Row(
              children: <Widget>[
                Radio(
                  value: 1, //F to C option 1 
                  groupValue: groupValue, 
                  onChanged: (e) => {
                    //TODO conversion logic
                    performConversion(e!)
                   }),
                   Text('F to C'),
                   SizedBox(height: 10.0,),
                   Radio(
                  value: 2, //C to F option 1 
                  groupValue: groupValue, 
                  onChanged: (e) => {
                    //TODO conversion logic
                    performConversion(e!)
                   }),
                   Text('C to F'),
              ],
            ),
            SizedBox( height: 10.0),
            TextButton(
              onPressed: ()=>{
                setState(() {
                  //Perform clearing operations
                  converted = "";
                  groupValue = 0;
                })
              }, 
              child: Text('Clear')),
              SizedBox( height: 20.0),
              Text(converted),
              SizedBox( height: 10.0),
              Slider(
                value: sliderValue, 
                onChanged: (value){},
                activeColor: sliderColor,
                min: 0,
                max:100.0

                )


          ]
        )
      ),
    );
  }
}
